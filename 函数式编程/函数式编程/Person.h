//
//  Person.h
//  函数式编程
//
//  Created by 王永旺永旺 on 2016/12/28.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

- (void)eat;
- (void)run;

- (Person *)eat1;
- (Person *)run1;


//关于函数编程和链式编程
//1.自己封装框架
//2.阅读其他人的框架
//如果要实现函数式编程,需要返回block
- (Person *(^)())eat2;
- (Person *(^)())run2;


- (Person *(^)(NSString *))eat3;
- (Person *(^)(float))run3;
@end
