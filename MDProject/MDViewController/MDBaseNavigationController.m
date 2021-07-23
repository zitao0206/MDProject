//
//  MDBaseNavigationController.m
//  MDProject
//
//  Created by lizitao on 17/3/28.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDBaseNavigationController.h"
#import "XYUrlAction.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "MDNavigationManager.h"

@interface MDBaseNavigationController ()

@end

@implementation MDBaseNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
}

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    UIViewController *viewController =  [super popViewControllerAnimated:animated];
//    [[MDNavigationManager manager] addViewController:viewController];
    return viewController;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    UIViewController *viewController = [[MDNavigationManager manager] obtainViewCtroller:viewController1];
    if (!animated && viewController.urlAction.animation == MDNaviAnimationNone)
    {
        // 无动画
        [super pushViewController:viewController animated:animated];
        _inAnimating = NO;
        return;
    }
    _inAnimating = YES;
    [super pushViewController:viewController animated:animated];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        _inAnimating = NO;
    });
}

- (void)pushViewController:(UIViewController *)viewController withAnimation:(BOOL)animated
{
    [self pushViewController:viewController animated:animated];
    if (!animated)
    {
        // 无动画
        _inAnimating = NO;
    }
}

@end
