//
//  Baby_MainSideViewController.m
//  BabyT
//
//  Created by Sincere on 16/4/10.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_MainSideViewController.h"

#import "Baby_BabyInfoView.h"

@interface Baby_MainSideViewController ()

@end

@implementation Baby_MainSideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self initView];
}

/**
 *  初始化UI
 */
- (void)initView
{
    Baby_BabyInfoView * infoView = [[Baby_BabyInfoView alloc] initWithFrame:self.presentedView.frame];
    [self.presentedView addSubview:infoView];
    [infoView addObserver:self forKeyPath:@"selectedType" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"%@",change);
}

@end
