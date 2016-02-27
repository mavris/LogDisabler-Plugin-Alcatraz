//
//  LogDisabler.m
//  LogDisabler
//
//  Created by Michalis Mavris on 26/02/16.
//  Copyright © 2016 Miksoft. All rights reserved.
//
//
#import "LogDisabler.h"
#import <Foundation/Foundation.h>
#import "LogController.h"

@interface LogDisabler()

@property (nonatomic, strong, readwrite) NSBundle *bundle;
@end

@implementation LogDisabler

+ (instancetype)sharedPlugin
{
    return sharedPlugin;
}

- (id)initWithBundle:(NSBundle *)plugin
{
    if (self = [super init]) {
        // reference to plugin's bundle, for resource access
        self.bundle = plugin;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didApplicationFinishLaunchingNotification:)
                                                     name:NSApplicationDidFinishLaunchingNotification
                                                   object:nil];
    }
    return self;
}

- (void)didApplicationFinishLaunchingNotification:(NSNotification*)noti
{
    //removeObserver
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSApplicationDidFinishLaunchingNotification object:nil];
    
    //Adding the menu buttons
    [self addMenuButtons];
    
}

- (void)addMenuButtons {
   
    // insert a menuItem to MainMenu "Edit"
    NSMenuItem* menuItem = [[NSApp mainMenu] itemWithTitle:@"Edit"];
    if (!menuItem) {
        return;
    }
    
    //Adding a seperator
    [[menuItem submenu] addItem:[NSMenuItem separatorItem]];
    
    //Adding a Snippet Group
    NSMenu* submenu = [[NSMenu alloc] init];
    
    NSMenuItem* mainItem = [[NSMenuItem alloc] init];
    [mainItem setTitle:@"Manage Logs"];
    
    [mainItem setSubmenu:submenu];
    [[menuItem submenu] addItem:mainItem];
    
    
    NSMenuItem* actionMenuItem;
    
    //Creating Enable Logs button with selector
    actionMenuItem = [[NSMenuItem alloc] initWithTitle:@"Enable Logs"
                                                action:@selector(enableLogs)
                                         keyEquivalent:@"e"];
    
    [actionMenuItem setKeyEquivalentModifierMask:NSControlKeyMask | NSShiftKeyMask];
    [actionMenuItem setTarget:self];

    //Adding the button in menu
    [submenu addItem:actionMenuItem];
    
    
   //Creating Disable Logs button with selector
    actionMenuItem = [[NSMenuItem alloc] initWithTitle:@"Disable Logs"
                                                action:@selector(disableLogs)
                                         keyEquivalent:@"d"];
    
    [actionMenuItem setKeyEquivalentModifierMask:NSControlKeyMask | NSShiftKeyMask];
    [actionMenuItem setTarget:self];
    
    //Adding the button in menu
    [submenu addItem:actionMenuItem];
    
}

- (void)enableLogs
{

    //Executing the task in terminal
    [[LogController sharedInstance]enableLogs];
    
}

- (void)disableLogs
{
    
    //Executing the task in terminal
    [[LogController sharedInstance] disableLogs];
    
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
