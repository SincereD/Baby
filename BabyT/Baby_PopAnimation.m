//
//  Baby_PopAnimation.m
//  
//
//  Created by Sincere on 16/4/25.
//
//

#import "Baby_PopAnimation.h"

@implementation Baby_PopAnimation

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
