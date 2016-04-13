//
//  Baby_PersonalInfoViewController.m
//  BabyT
//
//  Created by Sincere on 16/3/6.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_PersonalInfoViewController.h"

@interface Baby_PersonalInfoViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray * _cellName;
    UITableView * _table;
}

@end

@implementation Baby_PersonalInfoViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setTabbarTitle:@"我的"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _cellName = @[@"宝贝信息",@"照片管理",@"意见反馈",@"关于我们"];
    [self tableView];
}

/**
 *  初始化表格
 */
- (void)tableView
{
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStyleGrouped];
    [_table setDelegate:self];
    [_table setDataSource:self];
    [self.view addSubview:_table];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

# pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1)
    {
        return 4;
    }else
    {
        return 1;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
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
    [self setCellTypeWithIndexPath:indexPath cell:cell];
    return cell;
}

- (void)setCellTitleWithIndexPath:(NSIndexPath*)indexPath cell:(UITableViewCell*)cell
{
    NSString * msg = nil;
    if (indexPath.section == 0)
    {
        msg = @"我";
    }
    else if (indexPath.section == 1)
    {
        msg = _cellName[indexPath.row];
    }
    else if (indexPath.section == 2)
    {
        msg = @"设置";
    }
    
    if (msg)
    {
        [cell.textLabel setText:msg];
    }
}

- (void)setCellTypeWithIndexPath:(NSIndexPath*)indexPath cell:(UITableViewCell*)cell
{
    if (indexPath.section!=1) {
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
}

# pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self pushToTargetVCWithIndexPath:indexPath];
}

- (void)pushToTargetVCWithIndexPath:(NSIndexPath*)indexPath
{
    if (indexPath.section == 0)
    {
//        [self.navigationController pushViewController:[Baby_TimeLineViewController new] animated:YES];
    }else if (indexPath.section == 1)
    {
//        [self.navigationController pushViewController:[Baby_ToolBoxViewController new] animated:YES];
    }
}

@end
