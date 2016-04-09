//
//  Baby_ExploreViewController.m
//  BabyT
//
//  Created by Sincere on 16/3/6.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_ExploreViewController.h"
#import "Baby_ToolBoxViewController.h"
#import "Baby_TimeLineViewController.h"

@interface Baby_ExploreViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray * _tableImageName;
}
@end

@implementation Baby_ExploreViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setTabbarTitle:@"发现"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _tableImageName = @[@"Explore_Baby.png",@"Explore_Find.png",@"Explore_ToolBox.png"];
}

# pragma mark - TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString * exploreCellId =@"ExploreCellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:exploreCellId];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:exploreCellId];
    }
    [self setCellTitleWithIndexPath:indexPath cell:cell];
    return cell;
}

- (void)setCellTitleWithIndexPath:(NSIndexPath*)indexPath cell:(UITableViewCell*)cell
{
    NSString * msg = @"NULL";
    if (indexPath.section == 0)
    {
        msg = @"宝贝圈";
    }
    else if (indexPath.section == 1)
    {
        msg = @"找一找";
    }else if (indexPath.section == 2)
    {
        msg = @"百宝箱";
    }
    else
    {
        msg = @"NULL";
    }
    [cell.imageView setImage:[UIImage imageNamed:_tableImageName[indexPath.section]]];
    [cell.textLabel setText:msg];
}

# pragma mark - TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self pushToTargetVCWithIndexPath:indexPath];
}

- (void)pushToTargetVCWithIndexPath:(NSIndexPath*)indexPath
{
    if (indexPath.section == 0)
    {
        [self.navigationController pushViewController:[Baby_TimeLineViewController new] animated:YES];
    }else if (indexPath.section == 1)
    {
        [self performSegueWithIdentifier:@"Find" sender:nil];
    }
    else if (indexPath.section == 2)
    {
        [self performSegueWithIdentifier:@"ToolBox" sender:nil];
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}
@end
