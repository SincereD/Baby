//
//  Baby_SideViewController.h
//  BabyT
//
//  Created by Sincere on 16/4/12.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Baby_SideViewController : UIViewController

/**
 *  显示
 */
- (void)show;

/**
 *  隐藏
 */
- (void)dissMissView;

@property (nonatomic,assign)UIViewController * baseVC;
@property (nonatomic,assign)CGFloat  panedWidth;
@property (nonatomic,assign)CGFloat  prestedWidth;
@property (nonatomic,assign)CGRect   tapRect;
@property (nonatomic,strong)UIView * maskView;
@property (nonatomic,strong)UIView * presentedView;

@end
