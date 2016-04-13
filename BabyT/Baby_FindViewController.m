//
//  Baby_FindViewController.m
//  BabyT
//
//  Created by Sincere on 16/3/29.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_FindViewController.h"
#import <BaiduMapAPI_Map/BMKMapView.h>

@interface Baby_FindViewController ()
{
    BMKMapView * _mapView;
}
@end

@implementation Baby_FindViewController

- (void)viewDidLoad
{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:@"找一找"];
    [self rightItme];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self initBaiduMap];
}

- (void)rightItme
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(search)];
}

/**
 *  右侧导航栏按钮事件
 */
- (void)search
{
    
}

# pragma mark - BaiduMap

- (void)initBaiduMap
{
    _mapView = [[BMKMapView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:_mapView];
}

@end
