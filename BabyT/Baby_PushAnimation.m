//
//  Baby_PushAnimation.m
//  BabyT
//
//  Created by Sincere on 16/4/25.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_PushAnimation.h"

@implementation Baby_PushAnimation

- (void)animateTransitionEvent
{
    [UIView animateWithDuration:0.5 animations:^{
        self.fromViewController.view.alpha = 0;
        self.toViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        [self completeTransition];
    }];
}

@end
