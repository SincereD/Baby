//
//  Baby_ArticleViewController.h
//  BabyT
//
//  Created by Sincere on 16/4/22.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Baby_MainNotificationData.h"

@interface Baby_ArticleViewController : UIViewController

- (instancetype)initWithData:(Baby_MainNotificationData*)data;

@property (nonatomic,strong) Baby_MainNotificationData * data;

@end
