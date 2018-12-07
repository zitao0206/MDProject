//
//  MDBaseToViewController.m
//  MDProject
//
//  Created by lizitao on 2018/12/7.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDBaseToViewController.h"
#import "MDBaseFromViewController.h"
#import "MDBaseBackTransition.h"

@interface MDBaseToViewController ()<UINavigationControllerDelegate>

@end

@implementation MDBaseToViewController

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{   
    if ([toVC isKindOfClass:[MDBaseFromViewController class]] && [fromVC isKindOfClass:[MDBaseToViewController class]]) {
        NSString *backVCTransition = [NSString stringWithFormat:@"%@BackTransition",NSStringFromClass([fromVC class])];
        MDBaseBackTransition *transition = [NSClassFromString(backVCTransition) new];
        return transition;
    }
    return nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}

- (UIView *)obtainCoverView
{
    return [UIView new];
}

@end
