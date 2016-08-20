//
//  UIImageView+WebCache.m
//  LoadImage
//
//  Created by mac1 on 16/8/4.
//  Copyright © 2016年 fuxi. All rights reserved.
//

#import "UIImageView+WebCache.h"

@implementation UIImageView (WebCache)

- (void)setImageWithUrl:(NSString *)url {
    
    
    NSLog(@"setImageWithUrl是否在主线程：%d", [[NSThread currentThread] isMainThread]);
//    [self performSelectorInBackground:@selector(downLoadImage:) withObject:url];
//    [self downLoadImage:url];
    [self downLoadWithGCD:url];
}

- (void) downLoadWithOpretion:(NSString *) urlStr {
    
    //创建一个队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    //下载图片
    [queue addOperationWithBlock:^{
        
        NSURL *url1 = [NSURL URLWithString:urlStr];
        //耗时最长
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url1]];
        
        //回调主线程
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            self.image = image;
        
        }];
    }];
    
}

- (void) downLoadWithGCD:(NSString *) urlStr {
    
    //异步添加任务
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSURL *url1 = [NSURL URLWithString:urlStr];
        
        //耗时最长
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url1]];
        
        //回调主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.image = image;
        });
    });
    
    
}





- (void)downLoadImage:(NSString *)urlStr {
    
    NSLog(@"downLoadImage是否在主线程：%d", [[NSThread currentThread] isMainThread]);
    NSURL *url1 = [NSURL URLWithString:urlStr];
    //耗时最长
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url1]];
    
    //重点：一切和UI有关的操作都要放在主线程中执行
//    self.image = image;
    
    //回调主线程
    [self performSelectorOnMainThread:@selector(showImage:) withObject:image waitUntilDone:NO];
}

- (void)showImage:(UIImage *) img {
    
    self.image = img;
}
@end
