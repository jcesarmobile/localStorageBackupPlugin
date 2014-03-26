//
//  localStorageBackupPlugin.h
//  localStorageBackupPlugin
//
//  Created by Julio Cesar Sanchez Hernandez on 3/26/14.
//
//

#import <Cordova/CDV.h>


@interface localStorageBackupPlugin : CDVPlugin
   
-(void)initPlugin:(CDVInvokedUrlCommand*)command;
-(void)getBackup:(CDVInvokedUrlCommand*)command;

- (void)onEnterBackground;

@end
