//
//  Baby_MsgEnterViewController.m
//  BabyT
//
//  Created by Sincere on 16/4/7.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_MsgEnterViewController.h"
#import "Baby_PwdEnterViewController.h"

@interface Baby_MsgEnterViewController ()

@end

@implementation Baby_MsgEnterViewController

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

- (IBAction)dismMiss:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)phoneMsg:(id)sender
{
    
}

- (IBAction)pwdEnter:(id)sender
{
    Baby_PwdEnterViewController * pwdVC = [[Baby_PwdEnterViewController alloc] init];
    [self.navigationController pushViewController:pwdVC animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
