//
//  MDBaseNavigatorProtocal.h
//  MDProject
//
//  Created by lizitao on 17/3/28.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#ifndef MDBaseNavigatorProtocal_h
#define MDBaseNavigatorProtocal_h

@protocol MDBaseNavigatorProtocal <NSObject>

@optional
/**
 设置该页面是否需要显示
 例如try模块和list模块就是不需要展示的
 默认是YES
 */
- (BOOL)shouldShow:(XYUrlAction *)urlAction;

/**
 页面是否是单例（即在导航堆栈中只会保留一个页面，当跳转到该页面的时候会将其堆栈之上的页面都pop掉）
 默认是NO
 */
+ (BOOL)isSingleton;

/**
 询问在进入该页面之前是否需要先登录
 默认是NO
 */
+ (BOOL)needsLogin:(XYUrlAction *)urlAction;

/**
 设置该页面是不是modal方式的展示模式
 默认是NO
 */
- (BOOL)isModalView;

/**
 导航控制器将要显示页面前，会调用handleWithURLAction:方法
 */
- (BOOL)handleWithURLAction:(XYUrlAction *)urlAction;

@end

#endif /* MDBaseNavigatorProtocal_h */
