//
//  Person.m
//  函数式编程
//
//  Created by 王永旺永旺 on 2016/12/28.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)eat{
    NSLog(@"%s",__func__);
}

- (void)run{
    NSLog(@"%s",__func__);
}

- (Person *)eat1{
    NSLog(@"%s",__func__);
    return self;
}

- (Person *)run1{
    NSLog(@"%s",__func__);
    return self;
}

- (Person *(^)())eat2{
    
    //1>返回值为block
    //2>返回的block的返回值为Person类型
    Person * (^eatBlock)() = ^{
        NSLog(@"eat2Block");
        return self;
    };
    return eatBlock;


}

- (Person *(^)())run2{
    
//    Person *(^runBlock)() = ^{
//        NSLog(@"runBlock");
//        return self;
//    
//    };
//    return runBlock;
    
    
    return ^{
        NSLog(@"run2Block");
        return self;
    };
}

//准备链式编程的带有参数的方法
- (Person *(^)(NSString *))eat3{
    
    Person *(^eatBlock3)(NSString *food) = ^Person *(NSString *food){
        NSLog(@"吃了%@",food);
        return self;
        
    };
    
    
    
    return eatBlock3;
    

}

- (Person *(^)(float))run3{
    
    Person *(^run3Block)(float num3) = ^(float num3){
        NSLog(@"跑步%.2f米",num3);
        return self;
    };
    return run3Block;

}



@end
