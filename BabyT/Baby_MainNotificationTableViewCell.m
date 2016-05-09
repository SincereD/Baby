//
//  Baby_MainNotificationTableViewCell.m
//  BabyT
//
//  Created by Sincere on 16/4/19.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_MainNotificationTableViewCell.h"

@implementation Baby_MainNotificationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setData:(Baby_MainNotificationData*)data
{
    [self.titleLab setText:data.article_title];
    [self.contentLab setText:data.content];
    [self.typeLab setText:[data type]];
}

@end
