//
//  Baby_User.h
//  BabyT
//
//  Created by Sincere on 16/4/20.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  用户数据模型.
 */
@interface Baby_User : NSObject

@property (nonatomic,copy) NSString * userName;///用户名.
@property (nonatomic,copy) NSString * phoneNumber;///手机号码
@property (nonatomic,copy) NSString * userState;///用户状态
@property (nonatomic,copy) NSString * userAvatar;///用户头像
@property (nonatomic,copy) NSString * userAvatarThumb;///用户头像缓存
@property (nonatomic,copy) NSString * userFriendShip;///用户好友
@property (nonatomic,copy) NSString * userPreference;///用户偏好设置
@property (nonatomic,copy) NSString * userData;///用户动态信息

@end
