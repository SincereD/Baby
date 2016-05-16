//
//  Baby_MainViewController.m
//  BabyT
//
//  Created by Sincere on 16/3/6.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_MainViewController.h"

#import "Baby_BabyInfoViewController.h"
#import "Baby_MainSideViewController.h"
#import "Baby_ArticleViewController.h"

#import "Baby_Animation.h"
#import "Baby_AdvertiseView.h"
#import "Baby_BabyMessageView.h"
#import "Baby_MainTableHeader.h"
#import "Baby_MainNotificationTableViewCell.h"

#import "Baby_MainNotificationRequest.h"

@interface Baby_MainViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,Baby_MainNotificationProtocol>
{
    Baby_MainSideViewController * _sideVC;
    Baby_AdvertiseView * _advertiseView;
    Baby_BabyMessageView * _messageView;
    UITableView * _notificationTableView;
    Baby_MainNotificationRequest * _articleRequest;
    
    NSArray * _articleArray;
}
@end

@implementation Baby_MainViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setTabbarTitle:@"宝贝"];
    [self setSelectedTabbarColor:[UIColor redColor]];
    [self leftItem];
    [self.tabBarController.navigationItem setRightBarButtonItems:[self rightItems]];
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self removeLeftItem];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initSences];
    [self setNavStyle];
    [self initAdvertise];
    [self initMessageView];
    [self initNotificationTable];
    [self.navigationItem setRightBarButtonItems:[self rightItems]];
    [self initData];
    
}

- (void)initData
{
    _articleRequest = [[Baby_MainNotificationRequest alloc] init];
    [_articleRequest getArticleWithId:@"21684" page:@"1" delegate:self];
}

- (void)initSences
{
    self.view.backgroundColor = [UIColor colorWithRed:238.0f/255.0f green:238.0f/255.0f blue:238.0f/255.0f alpha:1.0f];
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
    [self showBabyInfo:nil];
}

- (void)share
{
    [self showLoginRegisterVC:nil];
}


/**
 *  创建广告页面
 */
- (void)initAdvertise
{
    _advertiseView = [[Baby_AdvertiseView alloc] init];
    [self.view addSubview:_advertiseView];
}

/**
 *  创建宝宝信息页面
 */
- (void)initMessageView
{
    _messageView = [[Baby_BabyMessageView alloc] initWithState:BabyStatePrepare];
    [self.view addSubview:_messageView];
}

/**
 *  创建推送信息表单
 */
- (void)initNotificationTable
{
    _articleArray = [NSArray array];
    
    UIView * edgeView = [[UIView alloc] initWithFrame:CGRectMake(5.0f, CGRectGetMaxY(_messageView.frame)+5.0f, ScreenWidth-10.0f, ScreenHeight-CGRectGetMaxY(_messageView.frame)-5.0f-49.0f)];
    [edgeView setBackgroundColor:[UIColor whiteColor]];
    [edgeView.layer setCornerRadius:10.0f];
    [self.view addSubview:edgeView];
    
    _notificationTableView = [[UITableView alloc] initWithFrame:CGRectMake(2, 2, CGRectGetWidth(edgeView.frame)-4, CGRectGetHeight(edgeView.frame)-2) style:UITableViewStylePlain];
    [_notificationTableView setShowsVerticalScrollIndicator:NO];
    [_notificationTableView setShowsHorizontalScrollIndicator:NO];
    [_notificationTableView setDelegate:self];
    [_notificationTableView setDataSource:self];
    [edgeView addSubview:_notificationTableView];
}

# pragma mark - Baby_MainNotificationProtocol

- (void)notificationDataRequestFail:(id)failError
{
    
}

- (void)notificationDataRequestSuccess:(NSArray *)articles
{
    _articleArray = articles;
    [_notificationTableView reloadData];
}

# pragma mark - UItabelViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0f;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[Baby_MainTableHeader alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:[[Baby_ArticleViewController alloc] initWithData:_articleArray[indexPath.row]] animated:YES];
}

# pragma mark _ UItableViewDataSource

- (Baby_MainNotificationTableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Baby_MainNotificationTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"NotificationCell"];
    if (!cell)
    {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"Baby_MainNotificationTableViewCell" owner:nil options:nil];
        cell = [nibs lastObject];
    }
    [cell setData:_articleArray[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _articleArray.count;
}

#pragma mark - 动画代理
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    
    Baby_Animation * transition = [[Baby_Animation alloc] init];
    return transition;
}


/**
 *  设置导航栏样式
 */
- (void)setNavStyle
{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:242.0f/255.0f green:242.0f/255.0f blue:242.0f/255.0f alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
}

/**
 *  移除导航栏左侧按钮
 */
- (void)removeLeftItem
{
    self.tabBarController.navigationItem.leftBarButtonItem = nil;
}

/**
 *  初始化导航栏左侧按钮
 */
- (void)leftItem
{
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn addTarget:self action:@selector(showSideVC) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setFrame:CGRectMake(0, 0, 26, 26)];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"Baby_Main_LeftIcon.png"] forState:UIControlStateNormal];
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.tabBarController.navigationItem.leftBarButtonItem = left;
}

/**
 *  显示侧边栏
 */
- (void)showSideVC
{
    if (_sideVC)
    {
        [_sideVC show];
    }else
    {
        _sideVC = [[Baby_MainSideViewController alloc] init];
        [_sideVC setBaseVC:self];
        [self.view addSubview:_sideVC.view];
        [_sideVC show];
    }
}

/**
 *  显示登陆页面
 *
 *  @param sender UIButton
 */
- (IBAction)showLoginRegisterVC:(id)sender
{
    Baby_MsgEnterViewController * loginVc = [[Baby_MsgEnterViewController alloc] init];
    UINavigationController * lrNav = [[UINavigationController alloc] initWithRootViewController:loginVc];
    [self presentViewController:lrNav animated:YES completion:^{
        
    }];
}

/**
 *  显示Baby信息完善页面
 *
 *  @param sender UIButton
 */
- (IBAction)showBabyInfo:(id)sender
{
    Baby_BabyInfoViewController * infoVc = [[Baby_BabyInfoViewController alloc] init];
    UINavigationController * lrNav = [[UINavigationController alloc] initWithRootViewController:infoVc];
    [self presentViewController:lrNav animated:YES completion:^{
        
    }];
}

@end
