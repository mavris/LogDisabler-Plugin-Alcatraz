//
//  LogController.h
//  LogDisabler
//
//  Created by Michalis Mavris on 26/02/16.
//  Copyright © 2016 Miksoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>


@interface DVTFileDataType : NSObject
@property (readonly) NSString* identifier;
@end

@interface DVTFilePath : NSObject
@property (readonly) NSURL* fileURL;
@property (readonly) DVTFileDataType* fileDataTypePresumed;
@end

@interface IDEWorkspace : NSWorkspace
@property (readonly) DVTFilePath* representingFilePath;
@end

@interface IDEWorkspaceDocument : NSDocument
@property (readonly) IDEWorkspace* workspace;
@end

@interface LogController : NSObject
+(LogController *) sharedInstance;
-(IDEWorkspaceDocument*)currentWorkspaceDocument;
-(void)disableLogs;
-(void)enableLogs;

@end