//
//  ViewController.m
//  Weak-StrongDance
//
//  Created by 王永旺永旺 on 2016/12/28.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,copy) void(^myBlock)();

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self;
    self.myBlock = ^{
        ViewController *strongSelf = weakSelf;
        NSLog(@"%@",strongSelf.view);
        [NSThread sleepForTimeInterval:2.0];
        NSLog(@"%@",strongSelf.view);
    };
    
    self.myBlock();
    
}

- (void)dealloc{
    NSLog(@"%s",__func__);
}





@end
