//
//  Baby_BabyMessageView.h
//  BabyT
//
//  Created by Sincere on 16/4/18.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import <UIKit/UIKit.h>

///主页信息视图
@interface Baby_BabyMessageView : UIView

typedef NS_ENUM(NSInteger, BabyState)
{
    BabyStateNone     = 0,
    BabyStatePrepare  = 1,
    BabyStatePregnant = 2,
    BabyStateBorn     = 3,
};

- (instancetype)initWithState:(BabyState)state;

/**
 *  宝贝的状态
 */
@property (nonatomic,assign)BabyState state;

@end
