//
//  Baby_ResetViewController.m
//  BabyT
//
//  Created by Sincere on 16/3/31.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_ResetViewController.h"

@interface Baby_ResetViewController ()

@end

@implementation Baby_ResetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"找回密码"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
