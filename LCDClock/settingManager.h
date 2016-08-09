//
//  settingManager.h
//  LCDClock
//
//  Created by chutima mungmee on 8/4/16.
//  Copyright © 2016 chutima mungmee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface settingManager : NSObject

/*@property (nonatomic) NSString *timeFormat;
@property (nonatomic) NSString *timeZone;
@property (nonatomic) UIColor *textColor;
@property (nonatomic) NSString *backgroundImage;
*/

+ (void) saveDictionaryToPList:(NSDictionary *)preferenceDict;
+ (NSMutableDictionary *) getDictionaryFromPList;

@end
