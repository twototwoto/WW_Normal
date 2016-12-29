//
//  ViewController.m
//  函数式编程
//
//  Created by 王永旺永旺 on 2016/12/28.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];

}

- (void)setupUI{
    
//    [self masDemo];
    
    [self selfDemo];
   
    
}

- (void)selfDemo{
    
    Person *person = [Person new];
    
    //1.传统的写法
    //1>run 和 eat的方法调用需要单独调用
    //2>不能随意混合顺序
    [person eat];
    [person run];
    
    
    //2.目标1.链式编程
    //run1 和 eat1方法调用完了之后需要返回Person对象
    id obj1 = [person eat1];
    [obj1 run1];
    
    id obj2 = [person run1];
    [obj2 run1];
    
    //自己组合的链式编程如下
    NSLog(@"自行组合的链式编程如下:");
    [[person eat1]run1];
    
    //3.目标2.函数式编程
//    person.eat2.run2();
    person.eat2().run2().eat2();
    person.run2().run2();
    
    //带有参数的函数编程
    person.eat3(@"bread").eat3(@"apple").run3(6688.68);
    

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
