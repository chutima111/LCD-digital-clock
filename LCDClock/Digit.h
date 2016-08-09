//
//  Digit.h
//  LCDClock
//
//  Created by chutima mungmee on 7/28/16.
//  Copyright © 2016 chutima mungmee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Digit : UIView
@property (weak, nonatomic) IBOutlet UIView *topCenterBar;
@property (weak, nonatomic) IBOutlet UIView *bottomCenterBar;
@property (weak, nonatomic) IBOutlet UIView *middleCenterBar;
@property (weak, nonatomic) IBOutlet UIView *topLeftBar;
@property (weak, nonatomic) IBOutlet UIView *lowerLeftBar;
@property (weak, nonatomic) IBOutlet UIView *topRightBar;
@property (weak, nonatomic) IBOutlet UIView *lowerRightBar;

-(void)showDigit:(NSInteger)digit;

-(void)setDigitColor:(UIColor*)color;

@end
