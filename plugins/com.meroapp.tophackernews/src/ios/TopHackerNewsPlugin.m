#import "TopHackerNewsPlugin.h"
#import "TopHackerNewsManager.h"

@implementation TopHackerNewsPlugin

- (void)showHackerNews:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        TopHackerNewsManager *newManager = [[TopHackerNewsManager alloc] init];
        [newManager initSDK];
        
        [newManager showHackerNews:^(NSArray *top20News) {
            
            NSString * msg = @"";
            
            for (NSString *str in top20News) {
                NSLog(@"%@",str);
                msg = [msg stringByAppendingString:str];
            }
            
            NSLog(@"%@",msg);
            
            CDVPluginResult* result = [CDVPluginResult
                                       resultWithStatus:CDVCommandStatus_OK
                                       messageAsString:msg];
            
            [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        }];
    }];
}

@end
