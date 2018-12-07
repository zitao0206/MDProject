//
//  MDBaseForwardTransition.m
//  MDProject
//
//  Created by lizitao on 2018/12/7.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDBaseForwardTransition.h"
#import "MDBaseFromViewController.h"
#import "MDBaseToViewController.h"
@implementation MDBaseForwardTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3f;
}

#pragma mark - 两个VC过渡动画
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //起始VC
    MDBaseFromViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //目的VC
    MDBaseToViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //转场视图容器
    UIView *containerView = [transitionContext containerView];
    
    
    NSIndexPath *indexPath = [[fromVC.collectionView indexPathsForSelectedItems] firstObject];
    fromVC.indexPath = indexPath; // 记录indexPath 返回时使用
    UICollectionViewCell *cell = (UICollectionViewCell *)[fromVC.collectionView cellForItemAtIndexPath:indexPath];
    
    // 对Cell上面的图片 做截图 来实现过渡动画视图
    UIView *screenShot = [cell snapshotViewAfterScreenUpdates:NO];
    screenShot.backgroundColor = [UIColor clearColor];
    screenShot.frame = fromVC.finiRect = [containerView convertRect:cell.frame fromView:cell.superview];
    
    
    toVC.view.hidden = YES;
    
    //把动画前后的两个ViewController加到容器控制器中，注意添加顺序
    [containerView addSubview:toVC.view];
    [containerView addSubview:screenShot];
    
    //现在开始做动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        //调用自动布局
        [containerView layoutIfNeeded];
        
        fromVC.view.alpha = 1.0;
        //布局坐标
        screenShot.frame = [containerView convertRect:[toVC obtainCoverView].frame toView:[toVC obtainCoverView].superview];
        
    } completion:^(BOOL finished) {
        [toVC obtainCoverView].hidden = NO;
        screenShot.alpha = 0;
        // 动画截图移除View
        [screenShot removeFromSuperview];

        toVC.view.hidden = NO;
        
        // 一定不要忘记告诉系统动画结束
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}
@end
