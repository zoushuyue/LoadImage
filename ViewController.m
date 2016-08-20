//
//  ViewController.m
//  LoadImage
//
//  Created by mac1 on 16/8/4.
//  Copyright © 2016年 fuxi. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *webImageVIew;

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *urlStr = @"http://pic32.nipic.com/20130817/9745430_101836881000_2.jpg";

    [self.webImageVIew setImageWithUrl:urlStr];
    
    
    
    
    
    
    
}



@end
