//
//  MDTransitionDetailViewController.m
//  MDProject
//
//  Created by lizitao on 2018/12/6.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDTransitionDetailViewController.h"
#import "MagicMoveBackTransition.h"
#import "MDTransitionViewController.h"
#import "MDURLAction.h"
#import "MDNavigator.h"

@interface MDTransitionDetailViewController ()<UINavigationControllerDelegate>
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation MDTransitionDetailViewController

// 执行手势驱动代理方法

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    if ([toVC isKindOfClass:[MDTransitionViewController class]]) {
        MagicMoveBackTransition *backTransition = [[MagicMoveBackTransition alloc] init];
        return backTransition;
    }
    return nil;
}

- (BOOL)handleWithURLAction:(MDURLAction *)urlAction
{
    self.image = (UIImage *)[urlAction anyObjectForKey:@"image"];
    return YES;
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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

- (void)dealloc
{
    NSLog(@"MDTransitionDetailViewController dealloc...");
}

@end
