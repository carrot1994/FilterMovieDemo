//
//  ViewController.m
//  FilterMovieDemo
//
//  Created by 周恩慧 on 2017/12/19.
//  Copyright © 2017年 周恩慧. All rights reserved.
//

#import "ViewController.h"
#import "ZFilterViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = ({
        UIButton *btn = [[UIButton alloc]init];
        [btn setTitle:@"clike me" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor redColor]];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
        btn.width = 100;
        btn.height = 50;
        btn.center = self.view.center;
        btn;
    });
    
    self.title = @"电影筛选";
    [self.view addSubview:btn];
}

- (void)clickAction {
    
    [self.navigationController pushViewController:[[ZFilterViewController alloc]init] animated:YES];
    
}


@end
