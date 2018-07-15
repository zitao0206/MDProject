//
//  MDNavigator.h
//  MDProject
//
//  Created by lizitao on 17/3/12.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDURLAction.h"
#import "MDBaseNavigationController.h"
#import "MDBaseNavigatorProtocal.h"

@interface MDNavigator : NSObject

/**
 具体由不同的App来定义。
 一般在业务层中需要重载提供自定义的MDNavigator（使用NVInternal.h NVInternalSetNavigator），并且子类必须实现NVNavigator
 */
+ (MDNavigator *)navigator;

/**
 设置程序的主导航控制器
 所有的页面跳转都会在mainNavigationContorller中进行
 */
- (void)setMainNavigationController:(MDBaseNavigationController *)mainNavigationContorller;

/**
 设置可以处理的URL Scheme
 */
- (void)setHandleableURLScheme:(NSString *)scheme;

/**
 设置URL mapping文件名称
 url mapping文件只能是包含在工程项目中的文件
 例如：
 @[@"dpmapping.dat", @"dptuanmapping.dat"]
 */
- (void)setFileNamesOfURLMapping:(NSArray *)fileNames;

- (UIViewController *)openURLAction:(MDURLAction *)urlAction;

@end

