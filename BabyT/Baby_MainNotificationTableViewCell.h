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
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (weak, nonatomic) IBOutlet UILabel *typeLab;
@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;

/**
 *  设置通知Cell属性
 *
 *  @param data Baby_MainNotificationData
 */
- (void)setData:(Baby_MainNotificationData*)data;

@end
