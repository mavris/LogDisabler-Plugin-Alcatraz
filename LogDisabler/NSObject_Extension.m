//
//  NSObject_Extension.m
//  LogDisabler
//
//  Created by Michalis Mavris on 26/02/16.
//  Copyright © 2016 Miksoft. All rights reserved.
//


#import "NSObject_Extension.h"
#import "LogDisabler.h"

@implementation NSObject (Xcode_Plugin_Template_Extension)

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin = [[LogDisabler alloc] initWithBundle:plugin];
        });
    }
}
@end
