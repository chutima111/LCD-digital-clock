//
//  Digit.m
//  LCDClock
//
//  Created by chutima mungmee on 7/28/16.
//  Copyright © 2016 chutima mungmee. All rights reserved.
//

#import "Digit.h"

@implementation Digit

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIView *digit = [[[NSBundle mainBundle] loadNibNamed:@"Digit" owner:self options:nil] objectAtIndex:0];
        digit.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:digit];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)setDigitColor:(UIColor *)color {
    
    self.topCenterBar.backgroundColor = color;
    self.middleCenterBar.backgroundColor = color;
    self.bottomCenterBar.backgroundColor = color;
    self.topLeftBar.backgroundColor = color;
    self.lowerLeftBar.backgroundColor = color;
    self.topRightBar.backgroundColor = color;
    self.lowerRightBar.backgroundColor = color;
}

    

-(void)showDigit:(NSInteger)digit {
    
    
    switch (digit) {
            
        case 0:
            self.topCenterBar.hidden = NO;
            self.middleCenterBar.hidden = YES;
            self.bottomCenterBar.hidden = NO;
            self.topLeftBar.hidden = NO;
            self.lowerLeftBar.hidden = NO;
            self.topRightBar.hidden = NO;
            self.lowerRightBar.hidden = NO;
            
            break;
        case 1:
            self.topCenterBar.hidden = YES;
            self.middleCenterBar.hidden = YES;
            self.bottomCenterBar.hidden = YES;
            self.topLeftBar.hidden = YES;
            self.lowerLeftBar.hidden = YES;
            self.topRightBar.hidden = NO;
            self.lowerRightBar.hidden = NO;
            
            break;
        case 2:
            self.topCenterBar.hidden = NO;
            self.middleCenterBar.hidden = NO;
            self.bottomCenterBar.hidden = NO;
            self.topLeftBar.hidden = YES;
            self.lowerLeftBar.hidden = NO;
            self.topRightBar.hidden = NO;
            self.lowerRightBar.hidden = YES;
            
            break;
        case 3:
            self.topCenterBar.hidden = NO;
            self.middleCenterBar.hidden = NO;
            self.bottomCenterBar.hidden = NO;
            self.topLeftBar.hidden = YES;
            self.lowerLeftBar.hidden = YES;
            self.topRightBar.hidden = NO;
            self.lowerRightBar.hidden = NO;
            
            break;
        case 4:
            self.topCenterBar.hidden = YES;
            self.middleCenterBar.hidden = NO;
            self.bottomCenterBar.hidden = YES;
            self.topLeftBar.hidden = NO;
            self.lowerLeftBar.hidden = YES;
            self.topRightBar.hidden = NO;
            self.lowerRightBar.hidden = NO;
            
            break;
        case 5:
            self.topCenterBar.hidden = NO;
            self.middleCenterBar.hidden = NO;
            self.bottomCenterBar.hidden = NO;
            self.topLeftBar.hidden = NO;
            self.lowerLeftBar.hidden = YES;
            self.topRightBar.hidden = YES;
            self.lowerRightBar.hidden = NO;
            
            break;
        case 6:
            self.topCenterBar.hidden = YES;
            self.middleCenterBar.hidden = NO;
            self.bottomCenterBar.hidden = NO;
            self.topLeftBar.hidden = NO;
            self.lowerLeftBar.hidden = NO;
            self.topRightBar.hidden = YES;
            self.lowerRightBar.hidden = NO;
            
            break;
        case 7:
            self.topCenterBar.hidden = NO;
            self.middleCenterBar.hidden = YES;
            self.bottomCenterBar.hidden = YES;
            self.topLeftBar.hidden = YES;
            self.lowerLeftBar.hidden = YES;
            self.topRightBar.hidden = NO;
            self.lowerRightBar.hidden = NO;
            
            break;
        case 8:
            self.topCenterBar.hidden = NO;
            self.middleCenterBar.hidden = NO;
            self.bottomCenterBar.hidden = NO;
            self.topLeftBar.hidden = NO;
            self.lowerLeftBar.hidden = NO;
            self.topRightBar.hidden = NO;
            self.lowerRightBar.hidden = NO;
            
            break;
        case 9:
            self.topCenterBar.hidden = NO;
            self.middleCenterBar.hidden = NO;
            self.bottomCenterBar.hidden = NO;
            self.topLeftBar.hidden = NO;
            self.lowerLeftBar.hidden = YES;
            self.topRightBar.hidden = NO;
            self.lowerRightBar.hidden = NO;
            
            break;
            
        default:
            break;
    }
}
    
@end
