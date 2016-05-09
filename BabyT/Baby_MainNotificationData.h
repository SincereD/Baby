//
//  Baby_MainNotificationData.h
//  BabyT
//
//  Created by Sincere on 16/4/19.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Baby_MainNotificationData : NSObject

- (instancetype)initWithJSONData:(NSDictionary*)JSONData;

- (NSString*)type;

@property (nonatomic,copy) NSString * ID;
@property (nonatomic,copy) NSString * article_title;
@property (nonatomic,copy) NSString * content;
@property (nonatomic,copy) NSString * type_id;
@property (nonatomic,copy) NSString * state;

@end
