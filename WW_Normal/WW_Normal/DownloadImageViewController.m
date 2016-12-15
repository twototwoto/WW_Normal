//
//  DownloadImageViewController.m
//  WW_Normal
//
//  Created by 王永旺永旺 on 2016/12/15.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import "DownloadImageViewController.h"

@interface DownloadImageViewController ()
/**
 滚动视图
 */
@property (nonatomic,strong) UIScrollView *scrollView;

/**
 图片视图
 */
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation DownloadImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSelectorInBackground:@selector(downloadImage) withObject:nil];
    
}

#pragma mark - 这个方法先于viewDidLoad调用 当view为nil的时候会调用这个方法
- (void)loadView{
    //创建滚动视图
    self.scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.bounces = NO;
    self.scrollView.backgroundColor = [UIColor cyanColor];
    //将滚动视图设置为根视图
    self.view = self.scrollView;

    //创建图片视图
    self.imageView = [[UIImageView alloc]init];
    [self.view addSubview:self.imageView];

}

/**********异步下载网络图片****************/
- (void)downloadImage{
    //拿到地址的url
    NSURL *url = [NSURL URLWithString:@"http://img.daimg.com/uploads/allimg/161005/1-161005114001.jpg"];
    //网络数据是以二进制的形式传送的
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    //回到主线程刷新UI
    [self performSelectorOnMainThread:@selector(updateUIWithImage:) withObject:image waitUntilDone:NO];


}

- (void)updateUIWithImage:(UIImage *)image{
    
    NSLog(@"updateUIWithImage");
    //设置图片视图
    self.imageView.image = image;
    //设置图片视图的大小和图片一样大
    [self.imageView sizeToFit];
    //设置滚动的视图的滚动范围和图片一样大
    self.scrollView.contentSize = image.size;
    
    
}

@end
