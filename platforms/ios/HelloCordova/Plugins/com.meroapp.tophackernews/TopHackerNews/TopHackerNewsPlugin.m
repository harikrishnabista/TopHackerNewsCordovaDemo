#import "TopHackerNewsPlugin.h"
#import "TopHackerNewsManager.h"

#import <TopHackerNews/TopHackerNewsSDK.h>

@implementation TopHackerNewsPlugin

- (void)showHackerNews:(CDVInvokedUrlCommand*)command
{

    TopHackerNewsSDK *sdk = [[TopHackerNewsSDK alloc] init];
    [sdk iniSDK];
    [sdk showHackerNews];
//    [self.commandDelegate runInBackground:^{
//        
//        
//
//    }];
}

@end
