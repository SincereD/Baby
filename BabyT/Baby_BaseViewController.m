//
//  Baby_BaseViewController.m
//  BabyT
//
//  Created by Sincere on 16/3/6.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_BaseViewController.h"

#import "Baby_ExploreViewController.h"
#import "Baby_KnowledgeViewController.h"
#import "Baby_MainViewController.h"
#import "Baby_PersonalInfoViewController.h"

@interface Baby_BaseViewController ()<UITabBarControllerDelegate>

@end

#define BabyClass      [Baby_MainViewController class]
#define ExploreClass   [Baby_MainViewController class]
#define KnowledgeClass [Baby_MainViewController class]
#define PersonalClass  [Baby_MainViewController class]

@implementation Baby_BaseViewController


# pragma mark UITabBarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if ([self VC:viewController isClass:BabyClass])
    {
        [self setTitle:@"宝贝"];
    }
    else if ([self VC:viewController isClass:KnowledgeClass])
    {
        [self setTitle:@"知识库"];
    }else if ([self VC:viewController isClass:ExploreClass])
    {
        [self setTitle:@"发现"];
    }else if ([self VC:viewController isClass:PersonalClass])
    {
        [self setTitle:@"我的"];
    }else
    {
        NSAssert(1, @"%s \n 错误的ViewController",__FUNCTION__);
    }
}

- (BOOL)VC:(UIViewController*)vc isClass:(Class)aClass
{
    return [[vc class] isKindOfClass:aClass];
}

@end
