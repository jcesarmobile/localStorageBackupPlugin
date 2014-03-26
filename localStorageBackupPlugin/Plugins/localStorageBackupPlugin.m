//
//  localStorageBackupPlugin.m
//  localStorageBackupPlugin
//
//  Created by Julio Cesar Sanchez Hernandez on 3/26/14.
//
//

#import "localStorageBackupPlugin.h"

@implementation localStorageBackupPlugin

-(void)initPlugin:(CDVInvokedUrlCommand*)command {
    NSLog(@"plugin initialized");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onEnterBackground)
                                                 name:UIApplicationDidEnterBackgroundNotification object:nil];
}
-(void)getBackup:(CDVInvokedUrlCommand*)command {
       NSLog(@"get backup");
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents directory
    
    NSString * fileContent = [[NSString alloc]initWithData:[NSData dataWithContentsOfFile:[documentsDirectory stringByAppendingPathComponent:@"localStorageBackup.txt"]] encoding:NSUTF8StringEncoding];
    NSLog(@"file content: %@",fileContent);
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:fileContent] callbackId:command.callbackId];
}
    
- (void)onEnterBackground {
    
        NSLog(@"app resign active");
        
        
        NSString* jsString = @"window.LSBPlugin.getAllLS();";
        NSString* someKeyValue = [self.webView  stringByEvaluatingJavaScriptFromString: jsString];
        NSLog(@"string: %@", someKeyValue);
        
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents directory
        
        NSError *error;
        BOOL succeed = [someKeyValue writeToFile:[documentsDirectory stringByAppendingPathComponent:@"localStorageBackup.txt"]
                                      atomically:YES encoding:NSUTF8StringEncoding error:&error];
        if (!succeed){
            // Handle error here
        }
        
        
        
}
    
@end
