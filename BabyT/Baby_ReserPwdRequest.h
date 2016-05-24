//
//  Baby_ReserPwdRequest.h
//  BabyT
//
//  Created by Sincere on 16/5/9.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Baby_ResetPwdProtocol.h"

@interface Baby_ReserPwdRequest : NSObject

- (void)resetPwdWithUserName:(NSString*)userName
                         msg:(NSString*)msg;

@property (nonatomic,assign) id<Baby_ResetPwdProtocol> delegate;

@end
