//
//  MDBaseFromViewController.m
//  MDProject
//
//  Created by Leon0206 on 2018/12/7.
//  Copyright © 2018年 Leon0206. All rights reserved.
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
        NSString *forwardVCTransition = [NSString stringWithFormat:@"%@ForwardTransition1",NSStringFromClass([fromVC class])];
        MDBaseForwardTransition *transition = [NSClassFromString(forwardVCTransition) new];
        if (![transition conformsToProtocol:@protocol(UIViewControllerAnimatedTransitioning)]) {
            transition = [MDBaseForwardTransition new];
        }
        return transition;
    }
    return nil;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}

@end
