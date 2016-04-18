//
//  Baby_AdvertiseView.m
//  BabyT
//
//  Created by Sincere on 16/4/10.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_AdvertiseView.h"

@interface Baby_AdvertiseView ()<UIScrollViewDelegate>
{
    UIScrollView  * _scroll;
    UIPageControl * _pageControl;
}
@end

@implementation Baby_AdvertiseView

- (instancetype)init
{
    if (self = [super init])
    {
        [self initSelf];
        [self initPageControl];
        [self initScorll];
    }
    return self;
}

/**
 *  初始化Advertise
 */
- (void)initSelf
{
    [self setFrame:CGRectMake(0, 64, ScreenWidth, 60)];
}

/**
 *  初始化ScrollView
 */
- (void)initScorll
{
    _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 60)];
    _scroll.pagingEnabled = YES;
    [_scroll setDelegate:self];
    [_scroll setContentSize:CGSizeMake(ScreenWidth*3, 60)];
    [_scroll setShowsVerticalScrollIndicator:NO];
    [_scroll setShowsHorizontalScrollIndicator:NO];
    [self addSubview:_scroll];
    [self sendSubviewToBack:_scroll];
    
    for (int i = 0; i < 3; i++)
    {
        UIView * aView = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth*i, 0, ScreenWidth, 60)];
        [_scroll addSubview:aView];
        
        UIColor * color ;
        if (i == 0 )
        {
            color = [UIColor orangeColor];
        }
        else if (i == 1)
        {
            color = [UIColor brownColor];
        }else
        {
            color = [UIColor grayColor];
        }
        [aView setBackgroundColor:color];
    }
}

/**
 *  初始化页面控制器
 */
- (void)initPageControl
{
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(ScreenWidth-60, 27, 60, 37)];
    [_pageControl setCurrentPage:0];
    [_pageControl setCurrentPageIndicatorTintColor:[UIColor redColor]];
    [_pageControl setPageIndicatorTintColor:[UIColor lightGrayColor]];
    [_pageControl setNumberOfPages:3];
    [_pageControl addTarget:self action:@selector(pageValue:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_pageControl];
}

# pragma mark _ PageControl

- (void)pageValue:(UIPageControl*)pageControl
{
    NSInteger index = pageControl.currentPage;
    [_scroll scrollRectToVisible:CGRectMake(index*ScreenWidth, 0, ScreenWidth, 60) animated:YES];
}

# pragma mark - UIScrollView Delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / ScreenWidth;
    [_pageControl setCurrentPage:index];
}

@end
