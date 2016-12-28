//
//  ViewController.m
//  Weak-strong_dance
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
    
    [self blockDemo];
    
  
    
}

- (void)blockDemo{
    
    //为了解决循环引用
    //1.定义block
    __weak typeof(self) weakSelf = self;
    
    self.myBlock = ^{
        
        //0.OC中定义变量，默认就是strong
        ViewController *strongSelf = weakSelf;
        
        //1.之前的版本，会正常输出
        NSLog(@"%@",strongSelf.view);
        [NSThread sleepForTimeInterval:2.0];
        
        //从Xcode7.3开始，包括操作系统
        //就不需要强弱引用
        //2.之前版本，会输出nil
        NSLog(@"%@",strongSelf.view);
        NSLog(@"%@",weakSelf.view);
        
    };
    //2.执行block
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.myBlock();
    });
    
}

- (void)dealloc{
    //下边的语句是相同的
    NSLog(@"%s",__func__);
    NSLog(@"%s",__FUNCTION__);
}





@end
