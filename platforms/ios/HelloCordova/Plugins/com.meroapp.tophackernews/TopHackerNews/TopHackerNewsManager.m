//
//  TopHackerNewsManager.m
//  TopHackerNews
//
//  Created by Hari Krishna Bista on 3/21/17.
//  Copyright © 2017 meroApp. All rights reserved.
//

#import "TopHackerNewsManager.h"

#define HACKER_NEWS_URL @"https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"

@implementation TopHackerNewsManager

-(void)initSDK{
    self.newsIds = [[NSMutableArray alloc] init];
    self.top20news = [[NSMutableArray alloc] init];
    self.apiCallCount = 0;
}

-(void)showHackerNews:(void (^)(NSArray *top20News))completionBlock{
    
    NSURL *URL = [NSURL URLWithString:HACKER_NEWS_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      if(error == NULL){
                                          NSMutableArray *ids = [[NSMutableArray alloc] init];
                                          ids = [NSJSONSerialization JSONObjectWithData: data options:NSJSONReadingMutableContainers error:nil];
                                          
                                          for (NSString *newsId in ids) {
                                              // making 20 different asynchronous call to get different news detail based on newsId
                                              if(self.apiCallCount < 20){
                                                  NSString *urlStr = [NSString stringWithFormat:@"https://hacker-news.firebaseio.com/v0/item/%lld.json?print=pretty", [newsId longLongValue]];
                                                  NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
                                                  NSURLSession *session = [NSURLSession sharedSession];
                                                  NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                                                          completionHandler:
                                                                                ^(NSData *data, NSURLResponse *response, NSError *error) {
                                                                                    
                                                                                    self.apiCallCount--;
                                                                                    
                                                                                    if(error == NULL){
                                                                                        NSString *news = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                                                        
                                                                                        [self.top20news addObject:news];
                                                                                    }
                                                                                    
                                                                                    // this condition checks end of 20 asynchrounous call
                                                                                    if(self.apiCallCount <= 0){
                                                                                        NSLog(@"top 20 stories downloaded reply back to plugin caller");
                                                                                        completionBlock(self.top20news);
                                                                                    }
                                                                                }];
                                                  [task resume];
                                                  
                                              }else{
                                                  break;
                                              }
                                              
                                              self.apiCallCount++;
                                          }
                                      }else{
                                          completionBlock(self.top20news);
                                          // response back that could not fetch the news
                                      }
                                  }];
    
    [task resume];
}

@end
