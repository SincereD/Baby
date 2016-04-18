//
//  Baby_BabyInfoView.m
//  BabyT
//
//  Created by Sincere on 16/4/10.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_BabyInfoView.h"

/**
 *  侧边栏宝贝信息
 */
@interface Baby_BabyInfoView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UIView      * headerView;
@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong)UIButton    * babyBtn;
@property (nonatomic,strong)UIButton    * subBabyBtn;
@property (nonatomic,strong)UILabel     * babyNameLab;
@property (nonatomic,copy)  NSArray     * cellTitleName;
@property (nonatomic,copy)  NSArray     * cellImageName;
@property (nonatomic,assign)NSInteger     selectedType;

@end

@implementation Baby_BabyInfoView

/**
 *  初始化
 *
 *  @param frame Frame
 *
 *  @return Instance
 */
- (instancetype)initWithFrame:(CGRect)frame;
{
    if (self = [super initWithFrame:frame])
    {
        [self setFrame:frame];
        [self initTable];
    }
    return self;
}

/**
 *  设置头属性
 */
- (UIView*)Header
{
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame),150)];
    [_headerView setBackgroundColor:[UIColor colorWithRed:238.0f/255.0f green:89.0f/255.0f blue:91.0f/255.0f alpha:1.0f]];
    
    _babyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_babyBtn setBackgroundImage:[UIImage imageNamed:@"宝宝头像.png"] forState:UIControlStateNormal];
    [_babyBtn setFrame:CGRectMake(20, 40, 50, 50)];
    [_headerView addSubview:_babyBtn];
    
    _babyNameLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, CGRectGetWidth(self.frame)-20, 30)];
    [_babyNameLab setTextColor:[UIColor whiteColor]];
    [_babyNameLab setText:@"测试宝贝名称"];
    [_babyNameLab setFont:[UIFont systemFontOfSize:15.0f]];
    [_headerView addSubview:_babyNameLab];
    return _headerView;
}

/**
 *  设置表格属性
 */
- (void)initTable
{
    _cellImageName = @[@"数胎动",@"食谱",@"b超",@"产检时间表",@"天气"];
    _cellTitleName = @[@"数胎动",@"孕期食谱",@"看懂B超单",@"产检时间表",@"天气以及空气质量"];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), _cellTitleName.count*50 + 150) style:UITableViewStylePlain];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [_tableView setScrollEnabled:NO];
    [self addSubview:_tableView];
}

# pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self setSelectedType:indexPath.row];
}

# pragma mark - UITableViewDataSource

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * babySideCellId = @"babySideCellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:babySideCellId];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:babySideCellId];
    }
    [cell.imageView setImage:[UIImage imageNamed:_cellImageName[indexPath.row]]];
    [cell.textLabel setText:_cellTitleName[indexPath.row]];
    return cell;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [self Header];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 150.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

@end
