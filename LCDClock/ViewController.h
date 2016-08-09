//
//  ViewController.h
//  LCDClock
//
//  Created by chutima mungmee on 7/28/16.
//  Copyright © 2016 chutima mungmee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Digit.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

@property (weak, nonatomic) IBOutlet UIView *clockContainer;
@property (nonatomic, weak) IBOutlet Digit *hourFirstDigit;
@property (weak, nonatomic) IBOutlet Digit *hourSecondDigit;
@property (weak, nonatomic) IBOutlet Digit *minuteFirstDigit;
@property (weak, nonatomic) IBOutlet Digit *minuteSecondDigit;
@property (weak, nonatomic) IBOutlet Digit *secondFirstDigit;
@property (weak, nonatomic) IBOutlet Digit *secondSecondDigit;
@property (weak, nonatomic) IBOutlet UILabel *lblAM;
@property (weak, nonatomic) IBOutlet UILabel *lblPM;
@property (weak, nonatomic) IBOutlet UIView *topDotSeparator;
@property (weak, nonatomic) IBOutlet UIView *bottomDotSeparator;

- (IBAction)btnSettingPressed:(id)sender;

@end

