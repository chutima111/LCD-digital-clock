//
//  settingViewController.h
//  LCDClock
//
//  Created by chutima mungmee on 7/31/16.
//  Copyright © 2016 chutima mungmee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "settingManager.h"

@interface settingViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *settingBackgroundImage;
@property (weak, nonatomic) IBOutlet UISwitch *btnSwitch;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *lblTimeZone;

- (IBAction)blueBtnPressed:(id)sender;
- (IBAction)greenBtnPressed:(id)sender;
- (IBAction)redBtnPressed:(id)sender;
- (IBAction)blackBtnPressed:(id)sender;

- (IBAction)doneBtnPressed:(id)sender;
- (IBAction)switchBtnPressed:(id)sender;

@end
