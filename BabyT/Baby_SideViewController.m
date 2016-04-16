//
//  Baby_SideViewController.m
//  BabyT
//
//  Created by Sincere on 16/4/12.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_SideViewController.h"

@interface Baby_SideViewController ()

@end

@implementation Baby_SideViewController

- (instancetype)init
{
    if (self = [super init])
    {
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self fitSize];
    [self createMaskView];
    [self createPresetedView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

/**
 *  屏幕适配
 */
- (void)fitSize
{
    self.view.backgroundColor = [UIColor clearColor];
    _prestedWidth = ScreenWidth / 7.0f * 6.0f;
    _tapRect = CGRectMake(_prestedWidth, 0, ScreenWidth - _prestedWidth, ScreenHeight);
    _panedWidth = 0;
}

/**
 *  创建蒙板
 */
- (void)createMaskView
{
    _maskView = [[UIView alloc] initWithFrame:ScreenBounds];
    _maskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0f];
    _maskView.alpha = 0.5f;
    [self.view addSubview:_maskView];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [_maskView addGestureRecognizer:tap];
    
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:pan];
}

/**
 *  创建展示页面
 */
- (void)createPresetedView
{
    _presentedView = [[UIView alloc] initWithFrame:CGRectMake(-_prestedWidth, 0, _prestedWidth, ScreenHeight)];
    [_presentedView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_presentedView];
}

/**
 *  空白区域点击提示
 *
 *  @param tap UITapGestureRecognizer
 */
- (void)handleTap:(UITapGestureRecognizer*)tap
{
    if (tap.state == UIGestureRecognizerStateEnded)
    {
        CGPoint aPoint = [tap locationInView:_maskView];
        
        if (CGRectContainsPoint(_tapRect, aPoint))
        {
            [self dissMissView];
        }
    }
}

/**
 *  平移手势
 *
 *  @param pan UIPanGestureRecognizer
 */
- (void)handlePan:(UIPanGestureRecognizer*)pan
{
    CGPoint panPoint = [pan translationInView:_maskView];
    _panedWidth += panPoint.x;
    
    if (_panedWidth>0)
    {
        _panedWidth = 0;
    }
    else
    {
        _presentedView.center = CGPointMake(_presentedView.center.x + panPoint.x, _presentedView.center.y);
        
        _maskView.alpha = 0.5f * (_prestedWidth + _panedWidth) / _prestedWidth;
    }
    
    CGFloat time = 0;
    if (pan.state == UIGestureRecognizerStateEnded)
    {
        if (_panedWidth < 0 && fabs(_panedWidth) > _prestedWidth/2.0f )
        {
            time = 0.5 * fabs(_panedWidth) / _prestedWidth;
            [self dissMissViewWithTime:time];
        }
        else
        {
            time = 0.5 * (1 - fabs(_panedWidth) / _prestedWidth);
            [self reverseWithTime:time];
        }
        _panedWidth = 0.0f;
    }
    
    [pan setTranslation:CGPointZero inView:_maskView];
}

/**
 *  显示
 */
- (void)show
{
    [self.baseVC.navigationController setNavigationBarHidden:YES animated:YES];
    [self.baseVC.tabBarController.tabBar setHidden:YES];

    [UIView animateWithDuration:0.5 animations:^{
        _maskView.alpha = 0.5f;
        _presentedView.frame = CGRectMake(0, 0, _prestedWidth, ScreenHeight);
    } completion:^(BOOL finished) {
        self.view.userInteractionEnabled = YES;
    }];
}

/**
 *  返回显示状态
 *
 *  @param time 时间
 */
- (void)reverseWithTime:(CGFloat)time
{
    
    [UIView animateWithDuration:time animations:^{
        _maskView.alpha = 0.5f;
        _presentedView.frame = CGRectMake(0, 0, _prestedWidth, ScreenHeight);
    } completion:^(BOOL finished) {

    }];
}

/**
 *  隐藏
 */
- (void)dissMissView
{
    [self.baseVC.navigationController setNavigationBarHidden:NO animated:YES];
    [self.baseVC.tabBarController.tabBar setHidden:NO];
    
    [UIView animateWithDuration:0.5 animations:^{
        _maskView.alpha = 0.0f;
        _presentedView.frame = CGRectMake(-_prestedWidth, 0, _prestedWidth, ScreenHeight);
    } completion:^(BOOL finished) {
        self.view.userInteractionEnabled = NO;
        self.baseVC.view.userInteractionEnabled = YES;
    }];
}

- (void)dissMissViewWithTime:(CGFloat)time
{
    [self.baseVC.navigationController setNavigationBarHidden:NO animated:YES];
    [self.baseVC.tabBarController.tabBar setHidden:NO];
    
    [UIView animateWithDuration:time animations:^{
        _maskView.alpha = 0.0f;
        _presentedView.frame = CGRectMake(-_prestedWidth, 0, _prestedWidth, ScreenHeight);
    } completion:^(BOOL finished) {
        self.view.userInteractionEnabled = NO;
        self.baseVC.view.userInteractionEnabled = YES;
    }];
}

/**
 *  隐藏当前显示页面
 */
- (void)disMissPresentedView
{
    [UIView animateWithDuration:0.5 animations:^{
        _maskView.alpha = 0.0f;
        _presentedView.frame = CGRectMake(-_prestedWidth, 0, _prestedWidth, ScreenHeight);
    } completion:^(BOOL finished) {

    }];
}

@end
