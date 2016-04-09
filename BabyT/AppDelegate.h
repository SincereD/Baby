//
//  AppDelegate.h
//  BabyT
//
//  Created by Sincere on 16/3/3.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Base/BMKMapManager.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) BMKMapManager * baiduManager;
@property (strong, nonatomic) UIWindow *window;


@end

