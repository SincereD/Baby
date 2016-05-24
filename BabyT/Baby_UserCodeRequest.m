//
//  Baby_UserCodeRequest.m
//  BabyT
//
//  Created by Sincere on 16/5/24.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_UserCodeRequest.h"

# define UserCodeURL @"http://120.76.136.195:20165/user/addCode"

@implementation Baby_UserCodeRequest

- (void)requestUserCodeWithPhoneNumber:(NSString*)phoneNum
{
    NSDictionary *parameters = @{@"username":phoneNum};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:UserCodeURL parameters:parameters success:^(NSURLSessionTask *task, id responseObject) {
        
        NSArray * responseData = [responseObject objectForKey:@"data"];
        NSLog(@"%@",responseData);
        NSLog(@"%@",[responseObject objectForKey:@"message"]);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        
    }];
}

@end
