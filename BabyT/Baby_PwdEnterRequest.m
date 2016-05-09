//
//  Baby_PwdEnterRequest.m
//  BabyT
//
//  Created by Sincere on 16/5/9.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_PwdEnterRequest.h"

# define pwdEnterURL @"http://120.76.136.195:20165/user/getUserLogin"

@implementation Baby_PwdEnterRequest

- (void)loginWithUserName:(NSString*)userName
                      pwd:(NSString*)pwd
{
    NSDictionary *parameters = @{@"username":userName , @"password":pwd};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:pwdEnterURL parameters:parameters success:^(NSURLSessionTask *task, id responseObject) {
                NSLog(@"JSON: %@", responseObject);
                NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
