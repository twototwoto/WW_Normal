//
//  ViewController.m
//  WW_Normal
//
//  Created by 王永旺永旺 on 2016/12/15.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *pthreadCreateThreadBtn;


@end


@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


/**********NSThread创建线程****************/
- (IBAction)NSThreadBtnClick:(id)sender {
    
    [self threadObjectMethod];
    [self threadClassMethod];
    [self threadNSObjectMethod];
    
    
}

#pragma mark - 继承自NSObject的类的对象 都可以调用这个方法 只不过拿不到线程对象
- (void)threadNSObjectMethod{
    //自动开启线程并且执行方法
    //下边的这个方法在NSObject (NSThreadPerformAdditions)里边即NSObject的分类
    [self performSelectorInBackground:@selector(NSThreadDemo:) withObject:@"NSObjectCategory"];
}

#pragma mark - 通过类方法创建 分离出来一个线程 不需要手动开启线程  自动开启线程并且执行方法
- (void)threadClassMethod{
    [NSThread detachNewThreadSelector:@selector(NSThreadDemo:) toTarget:self withObject:@"classMethodThread"];
}


#pragma Mark- 通过对象方法来创建线程 并且需要手动启动线程
- (void)threadObjectMethod{
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(NSThreadDemo:) object:@"objectMethodThread"];
    //手动启动线程
    [thread start];
}


- (void)NSThreadDemo:(id)obj{
    NSLog(@"传入参数%@",obj);
    NSLog(@"hello %@",[NSThread currentThread]);
    
    
}


/**********pthread创建线程****************/

/*
 //使用pthread创建子线程的简单步骤
 //1.导入头文件 #import <pthread.h>
 //2.指定新线程标识符
 //3.使用pthread创建线程的函数
 //4.根据result = 0 与否判断子线程创建成功与否
 //对创建子线程的函数的简单解析
 
 int pthread_create(pthread_t _Nullable * _Nonnull __restrict,
 const pthread_attr_t * _Nullable __restrict,
 void * _Nullable (* _Nonnull)(void * _Nullable),
 void * _Nullable __restrict);
 参数的意义分别为：
 pthread_t _Nullable * _Nonnull __restrict          传入到线程标识符的指针地址
 const pthread_attr_t * _Nullable __restrict        线程属性：传入指向线程属性的指针地址
 void * _Nullable (* _Nonnull)(void * _Nullable)    新线程要执行的函数(任务)，传入函数地址即函数名
 void * _Nullable __restrict:                       传入到函数的参数
 返回值为整型                                         0表示创建线程成功 否则创建线程失败
 
 
 参数3的进一步解释
 void * _Nullable    (* _Nonnull)   (void * _Nullable)
 函数返回值类型            函数名          函数参数
 
 */


#pragma mark - 创建线程的点击事件
- (IBAction)pthreadCreateThreadBtnClick:(id)sender {
    
    [self pthreadDemo];
    [self pthreadDemo2];
    
}


#pragma mark - pthread 创建子线程的代码实现
- (void)pthreadDemo{
    //参数1： 新线程的标识符
    pthread_t ID;
    
    //创建 指定标识符 指定参数为空 的线程
    int result = pthread_create(&ID, NULL, demo, NULL);
    if (result == 0) {
        NSLog(@"未传参数线程创建成功");
    }else{
        NSLog(@"未传参数线程创建失败");
    }
    
    
}

#pragma mark - pthread 创建子线程的代码实现
- (void)pthreadDemo2{
//    NSLog(@"pthreadDemo2 = %@",[NSThread currentThread]);
    //参数1： 新线程的标识符
    pthread_t id2;
    NSString *ocStr = @"hello iOS";
    
    //创建 指定标识符  指定参数 的线程
//    Implicit conversion of Objective-C pointer type 'NSString *' to C pointer type 'void *' requires a bridged cast
    int result = pthread_create(&id2, NULL, demo2, (__bridge void *)(ocStr));
    if (result == 0) {
        NSLog(@"传了参数的线程创建成功");
    }else{
        NSLog(@"传了参数的线程创建失败");
    }
    
    
}


#pragma mark - 创建的无参数新线程执行的函数
void *demo(void *param){
    NSLog(@"用于创建无参数线程当前线程%@",[NSThread currentThread]);
    return NULL;
}


#pragma mark - 创建的有参数新线程执行的函数
void *demo2(void *param){
//    Implicit conversion of Objective-C pointer type 'NSString *' to C pointer type 'void *' requires a bridged cast
    NSString *str = (__bridge NSString *)(param);
    
    NSLog(@"用于创建的有参数%@的线程-当前线程%@",str,[NSThread currentThread]);
    return NULL;
}


#pragma mark - test part you need not to open it
- (void)test{

    //#import "ViewController.h"
    //#import <pthread.h>
    //
    //@interface ViewController ()
    //@property (weak, nonatomic) IBOutlet UIButton *pthreadCreateThreadBtn;
    //
    //@end
    //
    //@implementation ViewController
    //
    //- (void)viewDidLoad {
    //    [super viewDidLoad];
    //
    //}
    //#pragma mark - 创建线程的点击事件
    //- (IBAction)pthreadCreateThreadBtnClick:(id)sender {
    //    //1.导入头文件 #import <pthread.h>
    //
    //    //2.使用pthread创建线程的函数
    //    /*
    //     int pthread_create(pthread_t _Nullable * _Nonnull __restrict,
    //     const pthread_attr_t * _Nullable __restrict,
    //     void * _Nullable (* _Nonnull)(void * _Nullable),
    //     void * _Nullable __restrict);
    //     参数的意义分别为：
    //     pthread_t _Nullable * _Nonnull __restrict          传入到线程标识符的指针地址
    //     const pthread_attr_t * _Nullable __restrict        线程属性：传入指向线程属性的指针地址
    //     void * _Nullable (* _Nonnull)(void * _Nullable)    新线程要执行的函数(任务)，传入函数地址即函数名
    //     void * _Nullable __restrict:                       传入到函数的参数
    //     返回值为整型                                         0表示创建线程成功 否则创建线程失败
    //
    //
    //     参数3的进一步解释
    //     void * _Nullable    (* _Nonnull)   (void * _Nullable)
    //     函数返回值类型            函数名          函数参数
    //
    //     */
    //    //    NSLog(@"当前线程-%@",[NSThread currentThread]);
    //    [self pthreadDemo];
    //    //    NSLog(@"当前线程-%@",[NSThread currentThread]);
    //    [self pthreadDemo2];
    //    //    NSLog(@"当前线程-%@",[NSThread currentThread]);
    //
    //}
    //
    //
    //#pragma mark - pthread 创建子线程的代码实现
    //- (void)pthreadDemo{
    //    //参数1： 新线程的标识符
    //    pthread_t ID;
    //
    //    //创建 指定标识符 指定参数为空 的线程
    //    int result = pthread_create(&ID, NULL, demo, NULL);
    //    if (result == 0) {
    //        NSLog(@"未传参数线程创建成功");
    //    }else{
    //        NSLog(@"未传参数线程创建失败");
    //    }
    //
    //
    //}
    //
    //#pragma mark - pthread 创建子线程的代码实现
    //- (void)pthreadDemo2{
    //    //    NSLog(@"pthreadDemo2 = %@",[NSThread currentThread]);
    //    //参数1： 新线程的标识符
    //    pthread_t id2;
    //    NSString *ocStr = @"hello iOS";
    //
    //    //创建 指定标识符  指定参数 的线程
    //    //    Implicit conversion of Objective-C pointer type 'NSString *' to C pointer type 'void *' requires a bridged cast
    //    int result = pthread_create(&id2, NULL, demo2, (__bridge void *)(ocStr));
    //    if (result == 0) {
    //        NSLog(@"传了参数的线程创建成功");
    //    }else{
    //        NSLog(@"传了参数的线程创建失败");
    //    }
    //
    //
    //}
    //
    //
    //#pragma mark - 创建的无参数新线程执行的函数
    //void *demo(void *param){
    //    NSLog(@"用于创建无参数线程当前线程%@",[NSThread currentThread]);
    //    return NULL;
    //}
    //
    //
    //#pragma mark - 创建的有参数新线程执行的函数
    //void *demo2(void *param){
    //    //    Implicit conversion of Objective-C pointer type 'NSString *' to C pointer type 'void *' requires a bridged cast
    //    NSString *str = (__bridge NSString *)(param);
    //    
    //    NSLog(@"用于创建的有参数%@的线程-当前线程%@",str,[NSThread currentThread]);
    //    return NULL;
    //}
    //
    //
    //
    //
    //
    //@end
}
/**********pthread创建线程****************/
@end



















