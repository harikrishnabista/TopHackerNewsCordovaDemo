//
//  TopHackerNewsManager.h
//  TopHackerNews
//
//  Created by Hari Krishna Bista on 3/21/17.
//  Copyright © 2017 meroApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopHackerNewsManager : NSObject

@property NSMutableArray *newsIds;
@property NSMutableArray *top20news;
@property int apiCallCount;

- (void)initSDK;

- (void)showHackerNews:(void (^)(NSArray *top20News))completionBlock;

@end

