//
//  Baby_ArticleViewController.m
//  BabyT
//
//  Created by Sincere on 16/4/22.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_ArticleViewController.h"

@interface Baby_ArticleViewController ()

@end

@implementation Baby_ArticleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setRightBarButtonItems:[self rightItems] animated:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (NSArray*)rightItems
{
 
    UIButton * saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveBtn setFrame:CGRectMake(0, 0, 20, 20)];
    [saveBtn setBackgroundImage:[UIImage imageNamed:@"文章收藏.png"] forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareBtn setFrame:CGRectMake(0, 0, 20, 20)];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"文章分享.png"] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * saveItem = [[UIBarButtonItem alloc] initWithCustomView:saveBtn];
    UIBarButtonItem * shareItem = [[UIBarButtonItem alloc] initWithCustomView:shareBtn];
    return @[saveItem,shareItem];
}

- (void)save
{
    
}

- (void)share
{
    
}

@end
