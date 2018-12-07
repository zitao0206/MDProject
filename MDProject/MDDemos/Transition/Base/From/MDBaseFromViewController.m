//
//  MDBaseFromViewController.m
//  MDProject
//
//  Created by lizitao on 2018/12/7.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDBaseFromViewController.h"
#import "MDBaseToViewController.h"
#import "MDBaseForwardTransition.h"
@interface MDBaseFromViewController ()<UINavigationControllerDelegate>

@end

@implementation MDBaseFromViewController

#pragma mark - 返回我们写好的转场对象

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    if ([toVC isKindOfClass:[MDBaseToViewController class]] && [fromVC isKindOfClass:[MDBaseFromViewController class]]) {
        NSString *forwardVCTransition = [NSString stringWithFormat:@"%@ForwardTransition",NSStringFromClass([fromVC class])];
        MDBaseForwardTransition *transition = [NSClassFromString(forwardVCTransition) new];
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

@end
