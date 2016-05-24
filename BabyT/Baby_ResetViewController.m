//
//  Baby_ResetViewController.m
//  BabyT
//
//  Created by Sincere on 16/3/31.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_ResetViewController.h"
#import "Baby_UserCodeRequest.h"

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

- (IBAction)getUserCodeAction:(id)sender
{
    Baby_UserCodeRequest * userCodeRequest = [[Baby_UserCodeRequest alloc] init];
    [userCodeRequest requestUserCodeWithPhoneNumber:@"13817607646"];
}
@end
