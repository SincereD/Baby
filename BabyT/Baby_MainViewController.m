//
//  Baby_MainViewController.m
//  BabyT
//
//  Created by Sincere on 16/3/6.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_MainViewController.h"

#import "Baby_BabyInfoViewController.h"
@implementation Baby_MainViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setTabbarTitle:@"宝贝"];
    [self setSelectedTabbarColor:[UIColor redColor]];
    
}

- (IBAction)showLoginRegisterVC:(id)sender
{
    Baby_MsgEnterViewController * loginVc = [[Baby_MsgEnterViewController alloc] init];
    UINavigationController * lrNav = [[UINavigationController alloc] initWithRootViewController:loginVc];
    [self presentViewController:lrNav animated:YES completion:^{
        
    }];
}

- (IBAction)showBabyInfo:(id)sender
{
    Baby_BabyInfoViewController * infoVc = [[Baby_BabyInfoViewController alloc] init];
    UINavigationController * lrNav = [[UINavigationController alloc] initWithRootViewController:infoVc];
    [self presentViewController:lrNav animated:YES completion:^{
        
    }];
}

@end
