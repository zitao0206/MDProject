//
//  MDToViewControllerBackTransition.m
//  CATransition
//
//  Created by xuxiwen on 16/6/11.
//  Copyright © 2016年 xuxiwen. All rights reserved.
//

#import "MDToViewControllerBackTransition.h"
#import "MDFromViewController.h"
#import "MDToViewController.h"

@implementation MDToViewControllerBackTransition

#pragma mark - 返回动画时间

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3f;
}

#pragma mark - 两个VC过渡动画


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    [super animateTransition:transitionContext];
}
@end
