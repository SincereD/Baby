//
//  AppDelegate.m
//  BabyT
//
//  Created by Sincere on 16/3/3.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _baiduManager = [[BMKMapManager alloc]init];
    BOOL ret = [_baiduManager start:@"z6XEdqEqwiBSOwncDWn9TmqvuWnzAGaa"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"百度地图启动失败！！！");
    }
    
    NSString *URLString = @"http://120.76.136.195:20165/content/getMp3List";
    NSDictionary *parameters = @{@"mp3_id":@"1461569824637644126" , @"currentPage":@"1"};
    
    NSURL *URL = [NSURL URLWithString:URLString];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:URL.absoluteString parameters:parameters success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        NSLog(@"%@",responseObject);
        NSArray * dataArray = [responseObject objectForKey:@"data"];
        for (NSDictionary * d in dataArray)
        {
            NSString * fileName = [d objectForKey:@"file_name"];
            NSString * fileUrl = [d objectForKey:@"file_url"];
            NSString * mp3Id = [d objectForKey:@"mp3_id"];
            NSString * mp3Name = [d objectForKey:@"mp3_name"];
            
            NSLog(@"--------------");
            NSLog(@"%@",fileName);
            NSLog(@"%@",[fileUrl stringByRemovingPercentEncoding]);
            NSLog(@"%@",fileUrl);
            NSLog(@"%@",mp3Id);
            NSLog(@"%@",mp3Name);
            
//            return;
//            NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//            AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//            
//            NSURL *URL = [NSURL URLWithString:[fileUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:fileUrl]]];
//            NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//            
//            NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
//                NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
//                return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
//            } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
//                NSLog(@"File downloaded to: %@", filePath);
//            }];
//            [downloadTask resume];

        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
