//
//  ViewController.m
//  LCDClock
//
//  Created by chutima mungmee on 7/28/16.
//  Copyright © 2016 chutima mungmee. All rights reserved.
//

#import "ViewController.h"
#import "Digit.h"
#import "settingManager.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate>

{
    NSString *_timeFormat;
    NSString *_timeZoneFormat;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//Test git
    
// Set the default background image
    self.backgroundImage.image = [UIImage imageNamed:@"flowers"];
    
// Hide the AM and PM label
    self.lblAM.hidden = YES;
    self.lblPM.hidden = YES;
    
// Trigger the time
    
    _timeFormat =  @"MM/dd/yyyy HH:mm:ss";
    _timeZoneFormat = @"EST";
    
    NSTimer *time = [NSTimer scheduledTimerWithTimeInterval:1.0
                                target:self
                                    selector:@selector(timeTick)
                                        userInfo:nil
                                            repeats:YES];
    
}


-(void)timeTick
{
    
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    
    [dateFormat setDateFormat:_timeFormat];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithAbbreviation:_timeZoneFormat]];

    NSString *dateString = [dateFormat stringFromDate:now];
    NSLog(@"now: %@", dateString);
    
    NSString *secondSecondDigit = [[dateString substringFromIndex:18]substringToIndex:1];
    [self.secondSecondDigit showDigit:secondSecondDigit.integerValue];
    
    NSString *firstSecondDigit = [[dateString substringFromIndex:17]substringToIndex:1];
    [self.secondFirstDigit showDigit:firstSecondDigit.integerValue];
    
    NSString *minuteSecondDigit = [[dateString substringFromIndex:15]substringToIndex:1];
    [self.minuteSecondDigit showDigit:minuteSecondDigit.integerValue];
    
    NSString *minuteFirstDigit = [[dateString substringFromIndex:14]substringToIndex:1];
    [self.minuteFirstDigit showDigit:minuteFirstDigit.integerValue];
    
    NSString *hourSecondDigit = [[dateString substringFromIndex:12]substringToIndex:1];
    [self.hourSecondDigit showDigit:hourSecondDigit.integerValue];
    
    NSString *hourFirstDigit = [[dateString substringFromIndex:11]substringToIndex:1];
    [self.hourFirstDigit showDigit:hourFirstDigit.integerValue];
    
// Check that is 12 hours time format?
// Add AM and PM
    NSString *twelveHourTimeString = @"MM/dd/yyyy hh:mm:ss a";
    
    if ([_timeFormat isEqualToString: twelveHourTimeString]) {
        NSString *aLetter = @"A";
        NSString *checkLetter = [[dateString substringFromIndex:20] substringToIndex:1];
        if ([aLetter isEqualToString:checkLetter]) {
            self.lblAM.hidden = NO;
            self.lblPM.hidden = YES;
            
        } else {
            self.lblPM.hidden = NO;
            self.lblAM.hidden = YES;
        }
        
    } else {
        self.lblAM.hidden = YES;
        self.lblPM.hidden = YES;
    }
    
}

-(void) viewWillAppear:(BOOL)animated
{
    NSMutableDictionary *preferenceDict = [settingManager getDictionaryFromPList];
    if (preferenceDict == nil) {
        preferenceDict = [[NSMutableDictionary alloc]init];
        
        NSData *theData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor blueColor]];
        [preferenceDict setObject:theData forKey:@"digitColor"];

    }
    
    NSData *theData = preferenceDict[@"digitColor"];
// Read from userDefaults
// Set the color
   // NSData *theData = [[NSUserDefaults standardUserDefaults] objectForKey:@"color"];
    
    UIColor *theColor = (UIColor *)[NSKeyedUnarchiver unarchiveObjectWithData:theData];
    
    [self.hourFirstDigit setDigitColor:theColor];
    [self.hourSecondDigit setDigitColor:theColor];
    
    [self.minuteFirstDigit setDigitColor:theColor];
    [self.minuteSecondDigit setDigitColor:theColor];
    
    [self.secondFirstDigit setDigitColor:theColor];
    [self.secondSecondDigit setDigitColor:theColor];
    
// Set the separator dot to the same color with the digits
    self.topDotSeparator.backgroundColor = theColor;
    self.bottomDotSeparator.backgroundColor = theColor;
    
// Read time format from userDefaults
// Set time format to timeTick function
    
//  NSString *timeFormatString = [[NSUserDefaults standardUserDefaults] objectForKey:@"timeFormat"];
    
//  Get time format in Dictionary
    NSString *timeFormatString = preferenceDict[@"timeFormat"];
    if (timeFormatString == nil) {
        _timeFormat =  @"MM/dd/yyyy HH:mm:ss";
    } else {
    _timeFormat = timeFormatString;
    
    }
    
// Read and set the timeZone from userDefaults
    
// NSString *timeZoneUserDefaults = [[NSUserDefaults standardUserDefaults] objectForKey:@"timeZone"];
    
// Get the timeZone in the dictionary
    NSString *timeZoneUserDefaults = preferenceDict[@"timeZone"];
    if (timeZoneUserDefaults == nil) {
        _timeZoneFormat = @"EST";
    } else {
        _timeZoneFormat = timeZoneUserDefaults;
    }
    
    
// Read image form userDefault
// Set image to setting background image
    
//    NSData *imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"image"];
//    UIImage *settingImageBackground = [UIImage imageWithData:imageData];
    
    NSString *imageName = preferenceDict[@"image"];
    UIImage *settingImageBackground = [UIImage imageNamed:imageName];
    self.backgroundImage.image = settingImageBackground;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSettingPressed:(id)sender {
    [self performSegueWithIdentifier:@"push_settingView" sender:self];
    
   
}


@end
