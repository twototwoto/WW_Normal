//
//  ViewController.m
//  WYWBlockDemo
//
//  Created by 王永旺永旺 on 2016/12/29.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self blockDemo];
    [self futherDemo];
}

- (void)blockDemo{
//   null
    //无返回值无参数
    void (^block1)() = ^{
        NSLog(@"block1");
    };
    block1();
    
    //无返回值有参数
    void(^block2)(int a,int b) = ^(int a,int b){
        NSLog(@"%d",a+b);
    };
    block2(2,2);
    
    //有返回值无参数
    int (^block3)() = ^{
        NSLog(@"1");
        return 1;
    };
    int block3Num = block3();
    NSLog(@"%d",block3Num);
    
    //有参数有返回值
    NSString *(^block4)(float) = ^(float distance){
        NSString *str = [NSString stringWithFormat:@"今天跑了%.2f米",distance];
        NSLog(@"%@",str);
        return str;
    };
    block4(6688.68);
    //0x0000 0000 0000 0000
    
//    NSNumber *(^block5)(NSNumber *a,NSNumber *b) = ^(NSNumber *a,NSNumber *b){
//        NSLog(@"%@",@(a.integerValue + b.integerValue));
//        return @(a.integerValue + b.integerValue);
//    };
//    block5(@3,@4);
    
//    NSNumber *(^block5)(NSNumber *a) = ^(NSNumber *a){
//        NSLog(@"%@",a);
//        return a;
//    };
//    block5(@5);
    
    
    
//    NSNumber *(^block5)(int a,int b) = ^(int a,int b){
//        NSLog(@"%@",@(a+b));
//        return @(a+b);
//    };
//    block5(2,4);

    
    
    int multiplier = 7;
    int (^myBlock)(int) = ^(int num) {
        return num * multiplier;
    };
    
    printf("%d", myBlock(3));
    
    
    
    
//    char *myCharacters[3] = { "TomJohn", "George", "Charles Condomine" };
//    
//    qsort_b(myCharacters, 3, sizeof(char *), ^(const void *l, const void *r) {
//        char *left = *(char **)l;
//        char *right = *(char **)r;
//        return strncmp(left, right, 1);
//    });
    
    // myCharacters is now { "Charles Condomine", "George", "TomJohn" }
    
    
}

- (void)conclude{
    /**
        1.block在初始化方面
            1> 对于返回值为基本数据类型的block的初始状态的地址为null
            2> 对于返回值为对象类型的block的初始状态的地址为0x0000 0000 0000 0000
     
     */
}

- (void)futherDemo{
    NSString *(^block1)(NSString *str,float a) = ^(NSString *str,float distance){
        NSString *strR = [NSString stringWithFormat:@"我去参加了%@行程%.2fkm",str,distance];
        NSLog(@"%@",strR);
        return strR;
    };
    block1(@"WWDC大会",666888.68);
}




@end
