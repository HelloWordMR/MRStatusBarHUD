//
//  ViewController.m
//  MRStatusBarHUDExample
//
//  Created by JMR on 16/4/16.
//  Copyright © 2016年 JMR. All rights reserved.
//

#import "ViewController.h"
#import "MRStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)message:(id)sender {
    [MRStatusBarHUD showMessage:@"没有什么事!!!!" image:[UIImage imageNamed:@"check"]];
}

- (IBAction)hide:(id)sender {
    [MRStatusBarHUD hide];
}

- (IBAction)loading:(id)sender {
    [MRStatusBarHUD showLoading:@"正在加载中..."];
}

- (IBAction)error:(id)sender {
    [MRStatusBarHUD showError:@"加载失败!"];
}

- (IBAction)success:(id)sender {
    [MRStatusBarHUD showSuccess:@"加载成功!"];
}


@end
