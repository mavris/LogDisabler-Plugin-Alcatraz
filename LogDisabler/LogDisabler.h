//
//  LogDisabler.h
//  LogDisabler
//
//  Created by Michalis Mavris on 26/02/16.
//  Copyright © 2016 Miksoft. All rights reserved.
//

#import <AppKit/AppKit.h>

@class LogDisabler;

static LogDisabler *sharedPlugin;

@interface LogDisabler : NSObject

+ (instancetype)sharedPlugin;
- (id)initWithBundle:(NSBundle *)plugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end