//
//  MDToViewController.m
//  MDProject
//
//  Created by lizitao on 2018/12/6.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDToViewController.h"
#import "MDToViewControllerBackTransition.h"
#import "MDFromViewController.h"
#import "XYUrlAction.h"

@interface MDToViewController ()
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation MDToViewController

- (void)handleWithURLAction:(XYUrlAction *)urlAction
{
    self.image = (UIImage *)[urlAction anyObjectForKey:@"image"];
}

- (UIView *)obtainCoverView
{
    return self.imageView;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]initWithImage:self.image];
    }
    return _imageView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.imageView = [[UIImageView alloc]initWithImage:self.image];
    [self.imageView sizeToFit];
    
    [self.view addSubview:self.imageView];

 
    if (self.imageView.frame.size.width > self.imageView.frame.size.height) {
        CGFloat height = self.imageView.frame.size.height/(self.imageView.frame.size.width/self.view.frame.size.width);
          CGFloat y = (self.view.frame.size.height - height) / 2;
        self.imageView.frame = CGRectMake(0, y, self.view.frame.size.width, height);
    } else {
        CGFloat width = self.imageView.frame.size.width/(self.imageView.frame.size.height/self.view.frame.size.height);
        CGFloat x = (self.view.frame.size.width - width) / 2;
        self.imageView.frame = CGRectMake(x, 0, width, self.view.frame.size.height);
    }
    
    self.titleLabel = [UILabel new];
    self.titleLabel.text = @"hello world";
    [self.titleLabel sizeToFit];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:20];
    self.titleLabel.textColor = [UIColor blueColor];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.frame = CGRectMake(0, 60, self.view.frame.size.width, 30);
    [self.view addSubview:self.titleLabel];
    [self.view bringSubviewToFront:self.titleLabel];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.imageView.hidden = YES;
    });

}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

- (void)dealloc
{
    NSLog(@"MDToViewController dealloc...");
}

@end
