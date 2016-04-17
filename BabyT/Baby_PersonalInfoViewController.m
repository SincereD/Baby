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
    NSArray * _sectionOneName;
    NSArray * _sectionTwoName;
    NSArray * _footerName;

    UITableView * _table;
    UIImageView * _tableFooterView;
}

@end

@implementation Baby_PersonalInfoViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self hideNavBar];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self showNavBar];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _sectionOneName = @[@"宝贝信息",@"照片管理"];
    _sectionTwoName = @[@"意见反馈",@"关于我们",@"设置"];
    [self tableView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTableFrame) name:UIApplicationWillChangeStatusBarFrameNotification object:nil];
}

/**
 *  初始化表格
 *  20 -> -40
 *  40 -> -20;
 */
- (void)tableView
{
    CGFloat statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height - 60;
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0,statusHeight, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
    [_table setDelegate:self];
    [_table setDataSource:self];
    [self.view addSubview:_table];
}

- (void)updateTableFrame
{
    CGFloat statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height - 60;
    [UIView animateWithDuration:0.3 animations:^{
        _table.frame = CGRectMake(0, statusHeight, ScreenWidth, ScreenHeight);
    }];
}

- (UIView*)tabelFooterView
{
    
    _footerName =@[@"收藏",@"积分",@"消息"];
    _tableFooterView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景.png"]];
    [_tableFooterView setUserInteractionEnabled:YES];
    [_tableFooterView setFrame:CGRectMake(0, 0, ScreenWidth, 50)];
    
    for (int i = 0 ; i < 3; i++)
    {
        CGRect btnRect = CGRectMake(i*ScreenWidth/3.0f, 0, ScreenWidth/3.0f, 50.0f);
        UIButton * footerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [footerBtn setFrame:btnRect];
        [footerBtn setImage:[UIImage imageNamed:_footerName[i]] forState:UIControlStateNormal];
        [footerBtn setImageEdgeInsets:UIEdgeInsetsMake(10, (ScreenWidth/3.0f - 15)/2, 25, (ScreenWidth/3.0f - 15)/2)];
        [_tableFooterView addSubview:footerBtn];
        
        UILabel * titleLab = [[UILabel alloc] initWithFrame:CGRectMake(i*ScreenWidth/3.0f, 30, ScreenWidth/3.0f, 20)];
        [titleLab setText:_footerName[i]];
        [titleLab setTextColor:[UIColor grayColor]];
        [titleLab setFont:[UIFont systemFontOfSize:15.0f]];
        [titleLab setTextAlignment:NSTextAlignmentCenter];
        [_tableFooterView addSubview:titleLab];
    }
    
    return _tableFooterView;
}

# pragma mark - UITableViewDataSource

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString * exploreCellId =@"ExploreCellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:exploreCellId];
    if (!cell)
    {
        UITableViewCellStyle style = UITableViewCellStyleDefault;
        if (indexPath.section == 0)
        {
            style = UITableViewCellStyleSubtitle;
        }
        cell = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:exploreCellId];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    [self setCellTitleWithIndexPath:indexPath cell:cell];
    return cell;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        return [self tabelFooterView];
    }
    return nil;
}

/**
 *  设置Cell属性
 *
 *  @param indexPath NSIndexPath
 *  @param cell      UITableViewCell
 */
- (void)setCellTitleWithIndexPath:(NSIndexPath*)indexPath cell:(UITableViewCell*)cell
{
    NSString * msg = nil;
    if (indexPath.section == 0)
    {
        msg = @"我";
        [cell.imageView setImage:[UIImage imageNamed:@"user.png"]];
        [cell.textLabel setTextColor:[UIColor whiteColor]];
        [cell setBackgroundColor:[UIColor colorWithRed:238.0f/255.0f green:96.0f/255.0f blue:87.0f/255.0f alpha:1.0f]];
        [cell.detailTextLabel setText:@"没女朋友"];
        [cell.detailTextLabel setTextColor:[UIColor whiteColor]];
        [cell setTintColor:[UIColor whiteColor]];
    }
    else if (indexPath.section == 1)
    {
        msg = _sectionOneName[indexPath.row];
        [cell.accessoryView setBackgroundColor:[UIColor whiteColor]];
        [cell.imageView setImage:[UIImage imageNamed:_sectionOneName[indexPath.row]]];
    }
    else if (indexPath.section == 2)
    {
        msg = _sectionTwoName[indexPath.row];
        [cell.imageView setImage:[UIImage imageNamed:_sectionTwoName[indexPath.row]]];
    }
    
    if (msg)
    {
        [cell.textLabel setText:msg];
    }
}

# pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section+1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 50.0f;
    }
    else
    {
        return 20.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0 )
    {
        return 0.0f;
    }
    else
    {
        return 20.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 150.0f;
    }
    else
    {
        return 44.0f;
    }
}

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
