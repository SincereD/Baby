//
//  Baby_MesEnterProtocol.h
//  BabyT
//
//  Created by Sincere on 16/5/9.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Baby_MsgEnterProtocol <NSObject>

- (void)msgEnterSuccess:(id)obj;

- (void)msgEnterFail:(id)obj;

@end
