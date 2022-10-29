//
//  UIViewController (swizzling).m
//  MDProject
//
//  Created by Leon0206 on 2018/2/3.
//  Copyright © 2018年 Leon0206. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#import <objc/message.h>

static CFTimeInterval beginTime = 0.0;
static CFTimeInterval endTime = 0.0;
static CFTimeInterval intervalTime = 0.0;
static NSString *className = @"";

@implementation UIViewController(Swizzling)



+ (void)load
{
    [super load];
    // 通过class_getInstanceMethod()函数从当前对象中的method list获取method结构体，如果是类方法就使用class_getClassMethod()函数获取。
//    Method fromBeginMethod = class_getInstanceMethod([self class], @selector(viewDidLoad));
//    Method toBeginMethod = class_getInstanceMethod([self class], @selector(swizzlingViewDidLoad));
//    if (!class_addMethod([self class], @selector(viewDidLoad), method_getImplementation(toBeginMethod), method_getTypeEncoding(toBeginMethod))) {
//        method_exchangeImplementations(fromBeginMethod, toBeginMethod);
//    }
    
//    Method fromEndMethod = class_getInstanceMethod([self class], @selector(viewDidAppear:));
//    Method toMeEndthod = class_getInstanceMethod([self class], @selector(swizzlingViewDidAppear));
//    if (!class_addMethod([self class], @selector(viewDidAppear:), method_getImplementation(toMeEndthod), method_getTypeEncoding(toMeEndthod))) {
//        method_exchangeImplementations(fromEndMethod, toMeEndthod);
//    }
}


// 我们自己实现的方法，也就是和self的viewDidLoad方法进行交换的方法。
- (void)swizzlingViewDidLoad
{
    NSString *str = [NSString stringWithFormat:@"%@", self.class];
    NSLog(@"swizzlingViewDidLoad---->%@", self.class);
    // 我们在这里加一个判断，将系统的UIViewController的对象剔除掉
//    if(![str containsString:@"UI"]) {
//        NSLog(@"viewDidLoad统计打点 : %@", self.class);
//        beginTime = CFAbsoluteTimeGetCurrent();
//        NSLog(@"beginTime:-------------->%@",@(beginTime));
        className = str;
//    }
    [self swizzlingViewDidLoad];
}

- (void)swizzlingViewDidAppear
{
    NSString *str = [NSString stringWithFormat:@"%@", self.class];
    NSLog(@"viewDidAppear---->%@", self.class);
    // 我们在这里加一个判断，将系统的UIViewController的对象剔除掉
    if(![str containsString:@"UI"] && [className isEqualToString:str]) {
//        NSLog(@"viewDidAppear统计打点 : %@", self.class);
        endTime = CFAbsoluteTimeGetCurrent();
//        NSLog(@"endTime:---------------->%@",@(endTime));
        intervalTime = endTime - beginTime;
//        NSLog(@"intervalTime:----------->%@",@(intervalTime));
    }
    [self swizzlingViewDidAppear];
}

@end
