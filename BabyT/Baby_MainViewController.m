//
//  Baby_MainViewController.m
//  BabyT
//
//  Created by Sincere on 16/3/6.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_MainViewController.h"

#import "Baby_BabyInfoViewController.h"
#import "Baby_MainSideViewController.h"

#import "Baby_AdvertiseView.h"
#import "Baby_BabyMessageView.h"

@interface Baby_MainViewController ()
{
    Baby_MainSideViewController * _sideVC;
    Baby_AdvertiseView * _advertiseView;
    Baby_BabyMessageView * _messageView;
}
@end

@implementation Baby_MainViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setTabbarTitle:@"宝贝"];
    [self setSelectedTabbarColor:[UIColor redColor]];
    [self leftItem];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self removeLeftItem];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initSences];
    [self setNavStyle];
    [self initAdvertise];
    [self initMessageView];
}

- (void)initSences
{
    self.view.backgroundColor = [UIColor whiteColor];
}

/**
 *  创建广告页面
 */
- (void)initAdvertise
{
    _advertiseView = [[Baby_AdvertiseView alloc] init];
    [self.view addSubview:_advertiseView];
}

- (void)initMessageView
{
    _messageView = [[Baby_BabyMessageView alloc] initWithState:BabyStatePrepare];
    [self.view addSubview:_messageView];
}

/**
 *  设置导航栏样式
 */
- (void)setNavStyle
{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:242.0f/255.0f green:242.0f/255.0f blue:242.0f/255.0f alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
}

/**
 *  移除导航栏左侧按钮
 */
- (void)removeLeftItem
{
    self.tabBarController.navigationItem.leftBarButtonItem = nil;
}

/**
 *  初始化导航栏左侧按钮
 */
- (void)leftItem
{
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn addTarget:self action:@selector(showSideVC) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setFrame:CGRectMake(0, 0, 26, 26)];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"Baby_Main_LeftIcon.png"] forState:UIControlStateNormal];
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.tabBarController.navigationItem.leftBarButtonItem = left;
}

/**
 *  显示侧边栏
 */
- (void)showSideVC
{
    if (_sideVC)
    {
        [_sideVC show];
    }else
    {
        _sideVC = [[Baby_MainSideViewController alloc] init];
        [_sideVC setBaseVC:self];
        [self.view addSubview:_sideVC.view];
        [_sideVC show];
    }
}

/**
 *  显示登陆页面
 *
 *  @param sender UIButton
 */
- (IBAction)showLoginRegisterVC:(id)sender
{
    Baby_MsgEnterViewController * loginVc = [[Baby_MsgEnterViewController alloc] init];
    UINavigationController * lrNav = [[UINavigationController alloc] initWithRootViewController:loginVc];
    [self presentViewController:lrNav animated:YES completion:^{
        
    }];
}

/**
 *  显示Baby信息完善页面
 *
 *  @param sender UIButton
 */
- (IBAction)showBabyInfo:(id)sender
{
    Baby_BabyInfoViewController * infoVc = [[Baby_BabyInfoViewController alloc] init];
    UINavigationController * lrNav = [[UINavigationController alloc] initWithRootViewController:infoVc];
    [self presentViewController:lrNav animated:YES completion:^{
        
    }];
}

@end
