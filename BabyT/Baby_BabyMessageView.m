//
//  Baby_BabyMessageView.m
//  BabyT
//
//  Created by Sincere on 16/4/18.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_BabyMessageView.h"

@interface Baby_BabyMessageView ()

@property (nonatomic,copy) NSString * headerImageName;
@property (nonatomic,copy) NSArray  * messages;
@property (nonatomic,copy) NSArray  * dataGroup;
@property (nonatomic,copy) NSMutableArray * labels;
@property (nonatomic,strong) UIImageView * headerImageView;
@property (nonatomic,strong) UILabel * titleLab;

@end

@implementation Baby_BabyMessageView

- (instancetype)initWithState:(BabyState)state
{
    if (self = [super init])
    {
        self.state = state;
        [self initData];
        [self initUI];
        [self initLabelsWithState:state];
    }
    return self;
}

/**
 *  初始化数据
 */
- (void)initData
{
    _labels = [NSMutableArray array];
    _headerImageName = @"怀孕状态.png";
    _messages = @[@"怀孕10周+3天，58天后出生",@"宝宝身高",@"宝宝体重"];
    _dataGroup = @[@"260~280mm",@"28~30g"];
}

/**
 *  初始化UI
 */
- (void)initUI
{
    [self setFrame:CGRectMake(0, 64+60, ScreenWidth, 120)];
    [self setBackgroundColor:[UIColor colorWithRed:238.0f/255.0f green:89.0f/255.0f blue:90.0f/255.0f alpha:1.0f]];
    UIGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:tap];
    
    
    _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, -25, 50, 50)];
    [_headerImageView setImage:[UIImage imageNamed:_headerImageName]];
    [_headerImageView.layer setCornerRadius:CGRectGetWidth(_headerImageView.frame)/2.0f];
    [self addSubview:_headerImageView];
    
    _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, ScreenWidth - CGRectGetWidth(_headerImageView.frame), CGRectGetHeight(_headerImageView.frame)/2.0f)];
    [_titleLab setText:_messages[0]];
    [_titleLab setTextColor:[UIColor whiteColor]];
    [_titleLab setFont:[UIFont systemFontOfSize:16.0f]];
    [self addSubview:_titleLab];

}

/**
 *  刷新Lable数据
 *
 *  @param state BabyState
 */
- (void)initLabelsWithState:(BabyState)state
{
    _state = state;
    for (UIView * view in _labels)
    {
        [view removeFromSuperview];
    }
    
    CGFloat width = ScreenWidth / _dataGroup.count;
    
    for (int i = 0; i<_dataGroup.count - 1; i++)
    {
        UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(width, CGRectGetHeight(self.frame)/4.0f+10, 2, CGRectGetHeight(self.frame)/2.0f)];
        [lineView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:lineView];
        [_labels addObject:lineView];
    }
    
    for (int i = 0; i<_dataGroup.count; i++)
    {
        UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(i*width, 40, width, 20)];
        [titleLabel setTextColor:[UIColor whiteColor]];
        [titleLabel setText:_messages[i+1]];
        [titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:titleLabel];
        
        UILabel * dataLabel = [[UILabel alloc] initWithFrame:CGRectMake(i*width, 70, width, 30)];
        [dataLabel setTextColor:[UIColor whiteColor]];
        [dataLabel setText:_dataGroup[i]];
        [dataLabel setFont:[UIFont systemFontOfSize:25.0f]];
        [dataLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:dataLabel];
    }
}

/**
 *  点击手势响应事件
 *
 *  @param tap UITapGestureRecognizer
 */
- (void)handleTap:(UITapGestureRecognizer*)tap
{
    
}

@end
