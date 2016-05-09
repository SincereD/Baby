//
//  Baby_MainNotificationRequest.h
//  BabyT
//
//  Created by Sincere on 16/5/9.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Baby_MainNotificationData.h"
#import "Baby_MainNotificationProtocol.h"
@interface Baby_MainNotificationRequest : NSObject

- (void)getArticleWithId:(NSString*)articleId
                    page:(NSString*)currentPage
                delegate:(id<Baby_MainNotificationProtocol>)delegate;

@property (nonatomic,assign) id <Baby_MainNotificationProtocol> delegate;
@end
