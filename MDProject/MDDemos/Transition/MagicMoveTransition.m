//
//  MagicMoveTransition.m
//  CATransition
//
//  Created by xuxiwen on 16/6/11.
//  Copyright © 2016年 xuxiwen. All rights reserved.
//

#import "MagicMoveTransition.h"
#import "MDTransitionViewController.h"
#import "MDTransitionDetailViewController.h"

@implementation MagicMoveTransition


#pragma mark - 返回动画时间

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3f;
}

#pragma mark - 两个VC过渡动画


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //起始VC
    MDTransitionViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //目的VC
    MDTransitionDetailViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //转场视图容器
    UIView *containerView = [transitionContext containerView];
    
    
    NSIndexPath *indexPath = [[fromVC.collectionView indexPathsForSelectedItems] firstObject];
    fromVC.indexPath = indexPath; // 记录indexPath 返回时使用
    UICollectionViewCell *cell = (UICollectionViewCell *)[fromVC.collectionView cellForItemAtIndexPath:indexPath];

    // 对Cell上面的图片 做截图 来实现过渡动画视图
    UIView *screenShot = [cell snapshotViewAfterScreenUpdates:NO];
    screenShot.backgroundColor = [UIColor clearColor];
    screenShot.frame = fromVC.finiRect = [containerView convertRect:cell.frame fromView:cell.superview];
    
    
    // 设置第二个控制器的位置和透明度
    toVC.view.alpha = 0.5;
    toVC.imageView.hidden = YES;
    // 把动画前后的两个ViewController加到容器控制器中
    [containerView addSubview:toVC.view];
    [containerView addSubview:screenShot];

        // 注意添加顺序
    
    // 现在开始做动画
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        //调用自动布局
        [containerView layoutIfNeeded];

        fromVC.view.alpha = 1.0;
        //布局坐标
        screenShot.frame = [containerView convertRect:toVC.imageView.frame toView:toVC.imageView.superview];
        
        NSLog(@"x:---------->%@",@(screenShot.frame.origin.x));
        NSLog(@"y:---------->%@",@(screenShot.frame.origin.y));
        NSLog(@"w:---------->%@",@(screenShot.frame.size.width));
        NSLog(@"h:---------->%@",@(screenShot.frame.size.height));
        
        
    } completion:^(BOOL finished) {
        toVC.imageView.hidden = NO;
        screenShot.alpha = 0;
        // 动画截图移除View
        [screenShot removeFromSuperview];
        toVC.view.alpha = 1;

        // 动画结束
        
        // 一定不要忘记告诉系统动画结束
        // 执行
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
}];

    
}






@end
