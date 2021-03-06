//
//  Baby_ReserPwdRequest.m
//  BabyT
//
//  Created by Sincere on 16/5/9.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_ReserPwdRequest.h"

# define UserCodeURL @"http://120.76.136.195:20165/user/addCode"

@implementation Baby_ReserPwdRequest

- (void)resetPwdWithUserName:(NSString*)userName
                         msg:(NSString*)msg
{
    NSDictionary *parameters = @{@"username":userName};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:UserCodeURL parameters:parameters success:^(NSURLSessionTask *task, id responseObject) {
        
        NSArray * responseData = [responseObject objectForKey:@"data"];
        NSLog(@"%@",responseData);
        [self.delegate resetPwdSuccess:responseData];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        
    }];
}

@end
