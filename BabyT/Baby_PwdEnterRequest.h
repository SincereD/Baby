//
//  Baby_PwdEnterRequest.h
//  BabyT
//
//  Created by Sincere on 16/5/9.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Baby_PwdEnterProtocol.h"

@interface Baby_PwdEnterRequest : NSObject

- (void)loginWithUserName:(NSString*)userName
                      pwd:(NSString*)pwd;

@end
