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

@property (nonatomic,strong)Baby_BabyInfoView * infoView;

@end

@implementation Baby_MainSideViewController

- (void)dealloc
{
    [_infoView removeObserver:self forKeyPath:@"selectedType"];
}

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
    _infoView = [[Baby_BabyInfoView alloc] initWithFrame:self.presentedView.frame];
    [self.presentedView addSubview:_infoView];
    [_infoView addObserver:self forKeyPath:@"selectedType" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"%@",change);
}

@end
