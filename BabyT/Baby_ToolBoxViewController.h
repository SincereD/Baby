//
//  Baby_ToolBoxViewController.h
//  BabyT
//
//  Created by Sincere on 16/3/10.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Baby_ToolBoxViewController : UIViewController
- (void)tiaozhangAction:(UIButton *)sender;
- (void)youxiAction:(UIButton *)sender;
- (void)huiheAction:(UIButton *)sender;
- (void)yaoqingAction:(UIButton *)sender;
- (void)friendAction:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *mGameButton;
@property (weak, nonatomic) IBOutlet UIButton *mHuiheButton;
@property (weak, nonatomic) IBOutlet UIButton *mYaoqinButton;
@property (weak, nonatomic) IBOutlet UIButton *mFriendButton;
@property (weak, nonatomic) IBOutlet UIButton *mTiaozhangButton;
@end
