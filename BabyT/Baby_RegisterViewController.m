//
//  Baby_RegisterViewController.m
//  BabyT
//
//  Created by Sincere on 16/3/22.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_RegisterViewController.h"

@interface Baby_RegisterViewController ()

@end

@implementation Baby_RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"注册"];
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
