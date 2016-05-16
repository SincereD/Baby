//
//  Baby_MainNotificationRequest.m
//  BabyT
//
//  Created by Sincere on 16/5/9.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_MainNotificationRequest.h"

#define ArticleURL @"http://120.76.136.195:20165/content/getContentList"

@implementation Baby_MainNotificationRequest

- (void)getArticleWithId:(NSString*)articleId
                    page:(NSString*)currentPage
                delegate:(id<Baby_MainNotificationProtocol>)delegate
{
    NSDictionary *parameters = @{@"id":articleId , @"currentPage":currentPage};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:ArticleURL parameters:parameters success:^(NSURLSessionTask *task, id responseObject) {
        
        NSArray * responseData = [responseObject objectForKey:@"data"];
        [delegate notificationDataRequestSuccess:[self getArticleWithData:responseData]];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        [delegate notificationDataRequestFail:error];
        
    }];
}

- (NSArray<Baby_MainNotificationData*>*)getArticleWithData:(NSArray*)responseData

{
    NSMutableArray * dataArray = [NSMutableArray array];
    
    int index = 0;
    for (NSDictionary * singleData in responseData)
    {
        index ++;
        if (index>3)
        {
            break;
        }
        Baby_MainNotificationData * data = [[Baby_MainNotificationData alloc] initWithJSONData:singleData];
        [dataArray addObject:data];
    }
    return dataArray;
}

@end
