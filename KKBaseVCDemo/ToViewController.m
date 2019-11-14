//
//  ToViewController.m
//  KKBaseVCDemo
//
//  Created by 干啥啥不行 吃饭第一名🥇 on 2019/11/14.
//  Copyright © 2019 干啥啥不行 吃饭第一名🥇. All rights reserved.
//

#import "ToViewController.h"

@interface ToViewController ()

@end

@implementation ToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(200, 200, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(dissmissVC) forControlEvents:UIControlEventTouchUpInside];
}

- (void)dissmissVC{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
