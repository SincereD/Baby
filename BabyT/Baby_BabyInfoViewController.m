//
//  Baby_BabyInfoViewController.m
//  BabyT
//
//  Created by Sincere on 16/4/9.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_BabyInfoViewController.h"

@interface Baby_BabyInfoViewController ()
{
    CGRect btnRect1;
    CGRect btnRect2;
    CGRect btnRect3;
    
    CGRect lineRect1;
    CGRect lineRect2;

    UIButton * _prepareBtn;
    UIButton * _duringBtn;
    UIButton * _finishedBtn;
}
@end

@implementation Baby_BabyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createRect];
    [self createUI];
}

/**
 *  屏幕适配
 */
- (void)createRect
{
    CGFloat aHeight = (ScreenHeight - 64) / 3.0f;
    CGFloat width = aHeight / 2.0f;
    
    btnRect1 = CGRectMake(ScreenWidth/2.0 - width*279/205/2.0, 64 + aHeight / 4.0f, width*279/205, width);
    
    lineRect1 = CGRectMake(30, 64+aHeight, ScreenWidth-60, 1);
    
    btnRect2 = CGRectMake(ScreenWidth/2.0 - width/2.0, aHeight / 4 * 5 +64, width, width);
    
    lineRect2 = CGRectMake(30, aHeight * 2+64, ScreenWidth-60, 1);
    
    btnRect3 = CGRectMake(ScreenWidth/2.0 - width*186/262/2.0, aHeight * 2 + aHeight / 4 + 64, width*186/262, width);
    
}

/**
 *  初始化控件
 */
- (void)createUI
{
    _prepareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_prepareBtn setFrame:btnRect1];
    [_prepareBtn setBackgroundImage:[UIImage imageNamed:@"BabyState_PrepareSelected"] forState:UIControlStateNormal];
    [_prepareBtn setBackgroundImage:[UIImage imageNamed:@"BabyState_PrepareSelected"] forState:UIControlStateSelected];
    [_prepareBtn addTarget:self action:@selector(prepare:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_prepareBtn];
    
    _duringBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_duringBtn setFrame:btnRect2];
    [_duringBtn setBackgroundImage:[UIImage imageNamed:@"BabyState_DuringSelected.png"] forState:UIControlStateNormal];
    [_duringBtn setBackgroundImage:[UIImage imageNamed:@"BabyState_DuringSelected.png"] forState:UIControlStateSelected];
    [_duringBtn addTarget:self action:@selector(prepare:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_duringBtn];
    
    _finishedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_finishedBtn setFrame:btnRect3];
    [_finishedBtn setBackgroundImage:[UIImage imageNamed:@"BabyState_FinishedSelected.png"] forState:UIControlStateNormal];
    [_finishedBtn setBackgroundImage:[UIImage imageNamed:@"BabyState_FinishedSelected.png"] forState:UIControlStateSelected];
    [_finishedBtn addTarget:self action:@selector(prepare:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_finishedBtn];
    
    UIImageView * line1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BabyState_Line"]];
    [line1 setFrame:lineRect1];
    [self.view addSubview:line1];
    
    UIImageView * line2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BabyState_Line"]];
    [line2 setFrame:lineRect2];
    [self.view addSubview:line2];
}

/**
 *  备孕选择
 */
- (void)prepare:(UIButton*)sender
{
    sender.selected = YES;
}

/**
 *  孕中选择
 */
- (void)during:(UIButton*)sender
{
    sender.selected = YES;
}

/**
 *  婴幼儿选择
 */
- (void)finished:(UIButton*)sender
{
    sender.selected = YES;
}

@end
