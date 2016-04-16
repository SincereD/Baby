//
//  Baby_BaseImplentionVC.m
//  BabyT
//
//  Created by Sincere on 16/3/7.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_BaseImplentionVC.h"

@interface Baby_BaseImplentionVC ()

@property (nonatomic,assign) Baby_SideViewController * sideVC;

@end

@implementation Baby_BaseImplentionVC

- (void)setTabbarTitle:(NSString*)title
{
    if (self.tabBarController)
    {
        [self.tabBarController setTitle:title];
    }
    else
    {
        NSAssert(1, @"当前无Tabbar");
    }
}

- (void)setSelectedTabbarColor:(UIColor*)color
{
    if (self.tabBarController)
    {
        [self.tabBarController.tabBar setTintColor:[UIColor redColor]];
    }else
    {
        NSAssert(1, @"当前无Tabbar");
    }
}

- (void)showTabbar
{
    [self.tabBarController.tabBar setHidden:NO];
}

- (void)hideTabbar
{
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)showNavBar
{
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)hideNavBar
{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)showSideViewController:(Baby_SideViewController*)sideVC
{
    _sideVC = sideVC;
}

- (void)disMissSideVC
{
    [UIView animateWithDuration:0.5 animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
}

@end
