//
//  MDSubRuntimeView.m
//  MDProject
//
//  Created by Leon0206 on 2018/2/3.
//  Copyright © 2018年 Leon0206. All rights reserved.
//

#import "MDSon.h"
#import <objc/runtime.h>

@implementation MDSon
+ (void)load
{
}

//+ (BOOL)resolveInstanceMethod:(SEL)sel
//{
//    Method backup = class_getInstanceMethod([self class], @selector(backupInstanceMethod:));
//    class_addMethod([self class], sel, class_getMethodImplementation(self, @selector(backupInstanceMethod:)), method_getTypeEncoding(backup));
//    return [super resolveInstanceMethod:sel];
//}
//
//+ (BOOL)resolveClassMethod:(SEL)sel
//{
//    Method backup = class_getClassMethod(self, @selector(backupClassMethod:));
//    Class metaClass = objc_getMetaClass(class_getName(self));
//    class_addMethod(metaClass, sel, class_getMethodImplementation(metaClass, @selector(backupClassMethod:)), method_getTypeEncoding(backup));
//    return [super resolveClassMethod:sel];
//}

- (void)backupInstanceMethod:(SEL)aSel
{
    NSLog(@"backupInstanceMethod: 实例方法%@没有找到..", NSStringFromSelector(aSel));
}

+ (void)backupClassMethod:(SEL)aSel
{
    NSLog(@"backupClassMethod: 类方法%@没有找到..", NSStringFromSelector(aSel));
}

@end
