//
//  MDNavigationManager.h
//  MDProject
//
//  Created by lizitao on 2017/6/18.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDNavigationManager : UIViewController

+ (instancetype)manager;

- (void)addViewController:(UIViewController *)viewController;
- (BOOL)isIncludeViewCtroller:(UIViewController *)viewController;
- (UIViewController *)obtainViewCtroller:(UIViewController *)viewController;

@end
