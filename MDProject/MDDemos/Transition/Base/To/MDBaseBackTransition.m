//
//  MDBaseBackTransition.m
//  MDProject
//
//  Created by lizitao on 2018/12/7.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDBaseBackTransition.h"
#import "MDBaseFromViewController.h"
#import "MDBaseToViewController.h"

@implementation MDBaseBackTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3f;
}

#pragma mark - 两个VC过渡动画
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // 目的VC
    MDBaseFromViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 起始VC
    MDBaseToViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 转场视图容器
    UIView *containerView = [transitionContext containerView];
    
    
    UIView *screenShot = [[fromVC obtainCoverView] snapshotViewAfterScreenUpdates:NO];
    screenShot.backgroundColor = [UIColor clearColor];
    screenShot.frame = [containerView convertRect:[fromVC obtainCoverView].frame fromView:[fromVC obtainCoverView].superview];
    [fromVC obtainCoverView].hidden = YES;
    
    // 初始化第二个Vc
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    
    UICollectionViewCell *cell = (UICollectionViewCell *)[toVC.collectionView cellForItemAtIndexPath:toVC.indexPath];
    cell.hidden = YES;
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    [containerView addSubview:screenShot];
    
    
    //发生动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        fromVC.view.alpha = 0;
        screenShot.frame = toVC.finiRect;
        
        
    } completion:^(BOOL finished) {
        
        [screenShot removeFromSuperview];
        [fromVC obtainCoverView].hidden = NO;
        cell.hidden = NO;
        fromVC.view.alpha = 1;
        
        // 结束
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        
    }];
}
@end
