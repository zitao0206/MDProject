//
//  MDBaseNavigationController.h
//  MDProject
//
//  Created by lizitao on 17/3/28.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDBaseNavigationController : UINavigationController

@property (nonatomic) BOOL inAnimating;

- (void)pushViewController:(UIViewController *)viewController withAnimation:(BOOL)animated;

@end
