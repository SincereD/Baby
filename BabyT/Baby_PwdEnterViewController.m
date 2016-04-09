//
//  Baby_PwdEnterViewController.m
//  BabyT
//
//  Created by Sincere on 16/4/7.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_PwdEnterViewController.h"
#import "Baby_ResetViewController.h"

@interface Baby_PwdEnterViewController ()

@end

@implementation Baby_PwdEnterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)backword:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)resetPwd:(id)sender
{
    Baby_ResetViewController * resetVC = [[Baby_ResetViewController alloc] init];
    [self.navigationController pushViewController:resetVC animated:YES];
}

@end
