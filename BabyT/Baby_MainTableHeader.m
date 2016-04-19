//
//  Baby_MainTableHeader.m
//  BabyT
//
//  Created by Sincere on 16/4/19.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_MainTableHeader.h"

@interface Baby_MainTableHeader ()

@property (nonatomic,strong) UILabel * titleLab;

@end

@implementation Baby_MainTableHeader

- (instancetype)init
{
    if (self = [super init])
    {
        [self initSence];
        [self initLab];
    }
    return self;
}

- (void)initSence
{
    [self setFrame:CGRectMake(0, 0, ScreenWidth - 10.0f , 30.0f)];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 29, CGRectGetWidth(self.frame), 1)];
    [lineView setBackgroundColor:[UIColor lightGrayColor]];
    [self addSubview:lineView];
}

- (void)initLab
{
    _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 60, 20)];
    [_titleLab setText:@"猜你喜欢"];
    [_titleLab setFont:[UIFont systemFontOfSize:15.0f]];
    [_titleLab setTextColor:[UIColor blackColor]];
    [self addSubview:_titleLab];
}

@end
