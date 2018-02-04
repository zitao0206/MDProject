//
//  MDRuntimeViewController.m
//  MDProject
//
//  Created by lizitao on 2018/2/3.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDRuntimeViewController.h"
#import "MDSon.h"
#import <objc/message.h>

@interface MDRuntimeViewController ()

@end

@implementation MDRuntimeViewController

- (void)dealloc
{
    
}

+ (void)load
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    NSLog(@"----->%@",NSStringFromSelector(_cmd));
    
    MDSon *son = [MDSon new];
    
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wundeclared-selector"
//    SEL selector = @selector(printName);
//    IMP method = [son methodForSelector:selector];
//    method();
//#pragma clang diagnostic pop
    
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wundeclared-selector"
//    //方法一
//    objc_msgSend(son, @selector(printName:), @"hello world...");
//    objc_msgSend(son, @selector(printIndex:), 200, 200);
//#pragma clang diagnostic pop
//
//
////方法二
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    if ([son respondsToSelector:@selector(printName:)]) {
        [son performSelector:@selector(printName:) withObject:@"hello world..."];
    }
    [MDSon performSelector:@selector(printTitle123)];
    [son performSelector:@selector(printTitle1234)];
#pragma clang diagnostic pop
//
////方法三
//    Ivar nameIvar = class_getInstanceVariable([son class], "_name");
//    NSString *name = object_getIvar(son, nameIvar);
//    NSLog(@"name: %@", name);
    
  
//    Class Daughter = objc_allocateClassPair([MDFather class], "Daughter", 0);
//    BOOL flag1 = class_addIvar(Daughter, "_name1", sizeof(NSString *), log2(sizeof(NSString *)), @encode(NSString *));
//    if (flag1) {
//        NSLog(@"NSString*类型  _name变量添加成功");
//    }
//    BOOL flag2 = class_addIvar(Daughter, "_age", sizeof(NSUInteger), log2(sizeof(NSUInteger)), @encode(NSUInteger));
//    if (flag2) {
//        NSLog(@"NSUIerteger*类型  _age变量添加成功");
//    }
//    //NSLog(@"判断Daughter类是否已经存在");
//    if(NSClassFromString(@"Daughter") != nil) return;
//    objc_registerClassPair(Daughter);
//    unsigned int varCount;
//    Ivar *varList = class_copyIvarList(Daughter, &varCount);
//    for (int i = 0; i<varCount; i++) {
//        NSLog(@"--->%s",ivar_getName(varList[i]));
//    }
//    free(varList);
//    id p1 = [[Daughter alloc]init];
//    //从类中获取成员变量Ivar
//    Ivar nameIvar = class_getInstanceVariable(Daughter, "_name1");
//    Ivar ageIvar = class_getInstanceVariable(Daughter, "_age");
//    //为p1的成员变量赋值
//    object_setIvar(p1, nameIvar, @"张三");
//    object_setIvar(p1, ageIvar, @11);
//    //获取p1成员变量的值
//    NSLog(@"%@",object_getIvar(p1, nameIvar));
//    NSLog(@"%@",object_getIvar(p1, ageIvar));
//    [NSThread sleepForTimeInterval:5.0f];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
}

@end
