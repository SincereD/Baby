//
//  Baby_BaseImplentionVC.h
//  BabyT
//
//  Created by Sincere on 16/3/7.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Baby_SideViewController.h"

@interface Baby_BaseImplentionVC : UIViewController

/**
 *  设置Tabbar标题
 *
 *  @param title 标题
 */
- (void)setTabbarTitle:(NSString*)title;

/**
 *  设置TabbarItme选中颜色
 *
 *  @param color UIcolor
 */
- (void)setSelectedTabbarColor:(UIColor*)color;

/**
 *  显示Tabbar
 */
- (void)showTabbar;

/**
 *  隐藏Tabbar
 */
- (void)hideTabbar;

/**
 *  显示侧边栏
 *
 *  @param sideVC UIViewController
 */
- (void)showSideViewController:(Baby_SideViewController*)sideVC;

/**
 *  隐藏侧边栏
 */
- (void)disMissSideVC;

@end
