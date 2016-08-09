//
//  settingManager.m
//  LCDClock
//
//  Created by chutima mungmee on 8/4/16.
//  Copyright © 2016 chutima mungmee. All rights reserved.
//

#import "settingManager.h"

@implementation settingManager

+ (void) saveDictionaryToPList:(NSDictionary *)preferenceDict
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *pathString = [documentsDirectory stringByAppendingPathComponent:@"preference.plist"];
/*    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:pathString]) {
        NSMutableDictionary *defaultsDictionary = [[NSMutableDictionary alloc]initWithContentsOfFile:pathString];
        [defaultsDictionary writeToFile:pathString atomically:YES];
    } else {
        NSMutableDictionary *defaultsDictionary = [[NSMutableDictionary alloc]init];
        [defaultsDictionary writeToFile:pathString atomically:YES];
    }
 */
    [preferenceDict writeToFile:pathString atomically:YES];
}

+ (NSMutableDictionary *) getDictionaryFromPList
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *pathString = [documentsDirectory stringByAppendingPathComponent:@"preference.plist"];

    NSMutableDictionary *preferenceDictionary = [[NSMutableDictionary alloc]initWithContentsOfFile:pathString];
    
    return preferenceDictionary;
}

@end
