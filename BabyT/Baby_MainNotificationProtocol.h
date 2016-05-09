//
//  Baby_MainNotificationProtocol.h
//  BabyT
//
//  Created by Sincere on 16/5/9.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Baby_MainNotificationProtocol <NSObject>

- (void)notificationDataRequestSuccess:(NSArray*)articles;

- (void)notificationDataRequestFail:(id)failError;

@end
