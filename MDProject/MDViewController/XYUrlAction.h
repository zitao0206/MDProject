//
//  MDURLAction.h
//  MDProject
//
//  Created by lizitao on 17/3/12.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NVObject.h"

typedef NSInteger MDNaviAnimation;
#define MDNaviAnimationNone -1 // 没有动画
#define MDNaviAnimationPush  0 // 标准的导航压入动画
@interface XYUrlAction : NSObject
/**
 需要导航到的url地址
 */
@property (nonatomic, strong, readonly) NSURL *url;

/**
 导航动画
 默认为NVNaviAnimationPush
 */
@property (nonatomic) MDNaviAnimation animation;

/**
 对应的NVURLPattern, online url mapping可能会修改pattern，所以需要将pattern粘贴在urlAction中
 */

+ (id)actionWithURL:(NSURL *)url;
+ (id)actionWithURLString:(NSString *)urlString;
- (id)initWithURL:(NSURL *)url;
- (id)initWithURLString:(NSString *)urlString;
//- (id)initWithHost:(NSString *)host;


- (void)setInteger:(NSInteger)intValue forKey:(NSString *)key;
- (void)setDouble:(double)doubleValue forKey:(NSString *)key;
- (void)setString:(NSString *)string forKey:(NSString *)key;
- (void)setObject:(NVObject *)object forKey:(NSString *)key;
/**
 如果参数不为4中基本类型，可以使用anyObject进行传递
 不建议使用该方法
 anyObject不支持在URL中进行传递
 */
- (void)setAnyObject:(id)object forKey:(NSString *)key;

- (NSInteger)integerForKey:(NSString *)key;
- (double)doubleForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;
- (NVObject *)objectForKey:(NSString *)key;

/**
 如果参数不为4中基本类型，可以使用anyObject进行传递
 不建议使用该方法
 anyObject不支持在URL中进行传递
 */
- (id)anyObjectForKey:(NSString *)key;

@end

@interface UIViewController (urlAction)
@property (nonatomic, strong) XYUrlAction *urlAction;
@end

