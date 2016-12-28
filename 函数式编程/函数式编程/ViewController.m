//
//  ViewController.m
//  函数式编程
//
//  Created by 王永旺永旺 on 2016/12/28.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];

}

- (void)setupUI{
    
    [self masDemo];

   
    
}


- (void)masDemo{
    
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        //Masonry的设置约束是一种链式编程的体现
        //        make.top.equalTo(self.view).offset(20);
        //        make.left.equalTo(self.view).offset(20);
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        
        //函数式编程
        //equalTo(self.view)
        //offset(20)
        
        //链式编程
        //equalTo(self.view).offset(20)
        
        
    }];

    
}





@end
