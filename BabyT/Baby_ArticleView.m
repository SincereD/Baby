//
//  Baby_ArticleView.m
//  BabyT
//
//  Created by Sincere on 16/5/16.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_ArticleView.h"

@interface Baby_ArticleView ()
{
    CGSize         _contentSize;
    UILabel      * _contentLab;
    UIScrollView * _contentScroll;
}
@end

@implementation Baby_ArticleView

- (instancetype)initWithContent:(NSString*)content
{
    if (self = [super init])
    {
        [self setFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        [self initContentSizeWithContent:content];
        [self initContenLabWithContent:content];
        [self initContentScroll];
    }
    return self;
}

- (void)initContentSizeWithContent:(NSString*)content
{
    _contentSize = [self sizeWithString:content font:[UIFont systemFontOfSize:15.0f] maxSize:CGSizeMake(ScreenWidth, MAXFLOAT)];
}

- (void)initContenLabWithContent:(NSString*)content
{
    _contentLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, _contentSize.height)];
    [_contentLab setText:content];
    [_contentLab setFont:[UIFont systemFontOfSize:15.0f]];
    [_contentLab setNumberOfLines:0];
}

- (void)initContentScroll
{
    _contentScroll = [[UIScrollView alloc] initWithFrame:self.frame];
    [_contentScroll setContentSize:_contentSize];
    [_contentScroll addSubview:_contentLab];
    [self addSubview:_contentScroll];
}

- (CGSize)sizeWithString:(NSString *)str
                    font:(UIFont *)font
                 maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName : font};
    CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

@end
