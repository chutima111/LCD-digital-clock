//
//  settingViewController.m
//  LCDClock
//
//  Created by chutima mungmee on 7/31/16.
//  Copyright © 2016 chutima mungmee. All rights reserved.
//

#import "settingViewController.h"
#import "Digit.h"
#import "settingManager.h"

@interface settingViewController () 
{
    NSArray *_timeZoneArray;
    NSArray *_imageArray;
    int imageIndex;
    
    NSMutableDictionary *preferenceDict;
}

@end

@implementation settingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
// Do any additional setup after loading the view.
    
    preferenceDict = [settingManager getDictionaryFromPList];
    if (preferenceDict == nil) {
        preferenceDict = [[NSMutableDictionary alloc]init];
    }

// Set the default value for switch buttton
//    NSUserDefaults *switchDefaults = [NSUserDefaults standardUserDefaults];
    
    BOOL switchBtn = [preferenceDict[@"switch"]boolValue];
    _btnSwitch.on = switchBtn;
    
// Initialize the timeZoneArray
    _timeZoneArray = [[NSArray alloc]initWithObjects:@"Pacific Standard Time", @"Central Standard Time", @"Eastern Standard Time", nil];
// Hide pickerView
    _pickerView.hidden = YES;

// Set up UI Picker view
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    
// Add TapGestureRecognizer to lblTimeZone label
    self.lblTimeZone.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHandle:)];
    [self.lblTimeZone addGestureRecognizer:tapRecognizer];
    
    
// Add SwipeGestureRecognizer
    self.settingBackgroundImage.userInteractionEnabled = YES;
    
    UISwipeGestureRecognizer *rightSwipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleRightSwipe:)];
    rightSwipeRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.settingBackgroundImage addGestureRecognizer:rightSwipeRecognizer];
    
// Add SwipeGestureRecognizer to left direction
    UISwipeGestureRecognizer *leftSwipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleLeftSwipe:)];
    leftSwipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.settingBackgroundImage addGestureRecognizer:leftSwipeRecognizer];
    
// set the value for image array index
    imageIndex = 0;
    
// Create array to hold all the images for background
    _imageArray = @[@"flowers", @"darkRiver", @"dawnSky", @"skylineBuilding"];
    
// Read and set the timeZone label from userDefaults
// NSString *timeZoneLabel = [[NSUserDefaults standardUserDefaults] objectForKey:@"timeZoneLabelText"];
    
// get the timeZone in Dictionary
    NSString *timeZoneLabel = preferenceDict[@"timeZoneLabelText"];
    if (timeZoneLabel == nil) {
        self.lblTimeZone.text = @"Eastern Standard Time";
    } else {
        self.lblTimeZone.text = timeZoneLabel;
    };
    
    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)tapHandle:(UITapGestureRecognizer *)tap
{
    _pickerView.hidden = NO;
}

-(void) handleRightSwipe:(UISwipeGestureRecognizer *)swipe
{
    if (imageIndex + 1 < 4) {
        imageIndex++;
        self.settingBackgroundImage.image = [UIImage imageNamed:_imageArray[imageIndex]];
    }
    
//    UIImage *imageName = self.settingBackgroundImage.image;
//    NSData *imageData = [NSData dataWithData:UIImageJPEGRepresentation(imageName, 1.0)];
    
    [preferenceDict setObject:_imageArray[imageIndex] forKey:@"image"];
    
/*    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:imageData forKey:@"image"];
    [defaults synchronize];
*/
}

-(void) handleLeftSwipe:(UISwipeGestureRecognizer *)swipe
{
    if (imageIndex - 1 >= 0) {
        imageIndex--;
        self.settingBackgroundImage.image = [UIImage imageNamed:_imageArray[imageIndex]];
    }
    [preferenceDict setObject:_imageArray[imageIndex] forKey:@"image"];
    
/*    UIImage *imageName = self.settingBackgroundImage.image;
    NSData *imageData = [NSData dataWithData:UIImageJPEGRepresentation(imageName, 1.0)];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:imageData forKey:@"image"];
    [defaults synchronize];
*/
}

// PickerView methods
// Number of component in my pickerView
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// Number of row in my pickerView
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _timeZoneArray.count;
}

// Name of each component in the each row
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _timeZoneArray[row];
}

// Capture the picker view selection
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *timeZoneAbbreviation;
    
    switch (row) {
        case 0:
            self.lblTimeZone.text = _timeZoneArray[row];
            timeZoneAbbreviation = @"PST";
            break;
        case 1:
            self.lblTimeZone.text = _timeZoneArray[row];
            timeZoneAbbreviation = @"CST";
            break;
            
        case 2:
            self.lblTimeZone.text = _timeZoneArray[row];
            timeZoneAbbreviation = @"EST";
            break;
            
        default:
            break;
    }
    
    NSString *timeZoneLabelText = self.lblTimeZone.text;
    [preferenceDict setObject:timeZoneAbbreviation forKey:@"timeZone"];
    [preferenceDict setObject:timeZoneLabelText forKey:@"timeZoneLabelText"];
    
/*    NSUserDefaults *timeZoneDefaults = [NSUserDefaults standardUserDefaults];
    [timeZoneDefaults setObject:timeZoneAbbreviation forKey:@"timeZone"];
    [timeZoneDefaults setObject:timeZoneLabelText forKey:@"timeZoneLabelText"];
    [timeZoneDefaults synchronize];
 */
    
}

- (IBAction)blueBtnPressed:(id)sender {
    NSData *theData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor blueColor]];
    
    [preferenceDict setObject:theData forKey:@"digitColor"];
    
/*    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:theData forKey:@"color"];
    [defaults synchronize];
 */
}

- (IBAction)greenBtnPressed:(id)sender {
    NSData *theData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor greenColor]];
    
    [preferenceDict setObject:theData forKey:@"digitColor"];
    
/*    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:theData forKey:@"color"];
    [defaults synchronize];
 */
}

- (IBAction)redBtnPressed:(id)sender {
    NSData *theData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor redColor]];
    
    [preferenceDict setObject:theData forKey:@"digitColor"];
    
/*    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:theData forKey:@"color"];
    [defaults synchronize];
 */
}

- (IBAction)blackBtnPressed:(id)sender {
    NSData *theData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor blackColor]];
    
    [preferenceDict setObject:theData forKey:@"digitColor"];
    
/*    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:theData forKey:@"color"];
    [defaults synchronize];
 */
}

- (IBAction)doneBtnPressed:(id)sender {
    
    [settingManager saveDictionaryToPList:preferenceDict];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)switchBtnPressed:(id)sender {
    
    if (_btnSwitch.on) {
        NSString *twentyFourHoursTimeFormat =  @"MM/dd/yyyy HH:mm:ss";
        BOOL onSwitch = YES;
        
        [preferenceDict setObject:twentyFourHoursTimeFormat forKey:@"timeFormat"];
        [preferenceDict setObject:@(onSwitch) forKey:@"switch"];
        
/*        NSUserDefaults *timeDefaults = [NSUserDefaults standardUserDefaults];
        [timeDefaults setObject:twentyFourHoursTimeFormat forKey:@"timeFormat"];
        [timeDefaults setBool:onSwitch forKey:@"switch"];
        [timeDefaults synchronize];
 */
        
    } else {
        NSString *twelveHoursTimeFormat =  @"MM/dd/yyyy hh:mm:ss a";
        BOOL offSwitch = NO;
        
        [preferenceDict setObject:twelveHoursTimeFormat forKey:@"timeFormat"];
        [preferenceDict setObject:@(offSwitch) forKey:@"switch"];
        
/*        NSUserDefaults *timeDefaults = [NSUserDefaults standardUserDefaults];
        [timeDefaults setObject:twelveHoursTimeFormat forKey:@"timeFormat"];
        [timeDefaults setBool:offSwitch forKey:@"switch"];
        [timeDefaults synchronize];
 */
    }
    
    
    
       
}
@end
