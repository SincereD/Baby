//
//  Baby_LoginViewController.m
//  BabyT
//
//  Created by Sincere on 16/3/22.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_LoginViewController.h"

@interface Baby_LoginViewController ()

@end

@implementation Baby_LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self hideTabbar];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self showTabbar];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)forget:(id)sender
{
    Baby_ResetViewController * resetVC = [[Baby_ResetViewController alloc] init];
    [self.navigationController pushViewController:resetVC animated:YES];
}

- (IBAction)faseRegister:(id)sender
{
    Baby_RegisterViewController * rVC = [[Baby_RegisterViewController alloc] init];
    [self.navigationController pushViewController:rVC animated:YES];
}

- (IBAction)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
