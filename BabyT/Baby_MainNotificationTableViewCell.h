//
//  Baby_MainNotificationTableViewCell.h
//  BabyT
//
//  Created by Sincere on 16/4/19.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Baby_MainNotificationData.h"

/**
 *  主页面信息Cell
 */
@interface Baby_MainNotificationTableViewCell : UITableViewCell

/**
 *  设置通知Cell属性
 *
 *  @param data Baby_MainNotificationData
 */
- (void)setData:(Baby_MainNotificationData*)data;

@end