//
//  MagicMoveBackTransition.m
//  CATransition
//
//  Created by xuxiwen on 16/6/11.
//  Copyright © 2016年 xuxiwen. All rights reserved.
//

#import "MagicMoveBackTransition.h"
#import "MDTransitionViewController.h"
#import "MDTransitionDetailViewController.h"
#import "MDTransitionDetailViewController.h"
#import "MDTransitionViewController.h"

@implementation MagicMoveBackTransition

#pragma mark - 返回动画时间

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3f;
}

#pragma mark - 两个VC过渡动画


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    // 目的VC
    MDTransitionViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 起始VC
    MDTransitionDetailViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 转场视图容器
    UIView *containerView = [transitionContext containerView];
    
    
    UIView *screenShot = [fromVC.imageView snapshotViewAfterScreenUpdates:NO];
    screenShot.backgroundColor = [UIColor clearColor];
    screenShot.frame = [containerView convertRect:fromVC.imageView.frame fromView:fromVC.imageView.superview];
    fromVC.imageView.hidden = YES;
    
    
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
        fromVC.imageView.hidden = NO;
        cell.hidden = NO;
        fromVC.view.alpha = 1;

        // 结束
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        
    }];
    
    
    
    
    
}
@end
