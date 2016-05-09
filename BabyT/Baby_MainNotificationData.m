//
//  Baby_MainNotificationData.m
//  BabyT
//
//  Created by Sincere on 16/4/19.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_MainNotificationData.h"

@implementation Baby_MainNotificationData

- (instancetype)initWithJSONData:(NSDictionary*)JSONData
{
    if (self = [super init])
    {
        self.ID = JSONData[@"id"];
        self.article_title = JSONData[@"article_title"];
        self.content = JSONData[@"content"];
        self.type_id = JSONData[@"type_id"];
        self.state = JSONData[@"state"];
    }
    return self;
}

- (NSString*)type
{
    if ([self.type_id isEqualToString:@"1"])
    {
        return @"孕前指导";
    }
    else if ([self.type_id isEqualToString:@"2"])
    {
        return @"孕期护理";
    }
    else if ([self.type_id isEqualToString:@"3"])
    {
        return @"婴儿护理";
    }else if ([self.type_id isEqualToString:@"4"])
    {
        return @"育儿指南";
    }else
    {
        return @"母婴宝典";
    }
}

@end
