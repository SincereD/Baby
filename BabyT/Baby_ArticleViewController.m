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
    [self.navigationItem setLeftBarButtonItems:[self rightItems] animated:YES];
}

- (NSArray*)rightItems
{
    UIBarButtonItem * saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
    UIBarButtonItem * shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(share)];
    return @[saveItem,shareItem];
}

- (void)save
{
    
}

- (void)share
{
    
}

@end
