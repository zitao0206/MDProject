//
//  MDCrashShieldManager.m
//  MDProject
//
//  Created by lizitao on 2018/6/22.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDCrashShieldManager.h"
#import <objc/message.h>
#import "JPEngine.h"
#import "MDFelix.h"

@implementation MDCrashShieldManager

+ (void)load
{
    Method fromBeginMethod = class_getInstanceMethod([self class], @selector(crashTest2));
    Method toBeginMethod = class_getInstanceMethod([self class], @selector(crashTest1));
    if (!class_addMethod([self class], @selector(crashTest1), method_getImplementation(toBeginMethod), method_getTypeEncoding(toBeginMethod))) {
        method_exchangeImplementations(fromBeginMethod, toBeginMethod);
    }
    [MDCrashShieldManager manager];
}

- (void)crashTest1
{
    NSLog(@"hello world1...");
}

- (void)crashTest2
{
    NSLog(@"hello world2...");
}

+ (instancetype)manager
{
    static MDCrashShieldManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (void)startPatch
{
    NSString *txtPath = [[NSBundle mainBundle] pathForResource:@"bugfix" ofType:@"js"];
    NSString *fixScriptString = [NSString stringWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    [JPEngine startEngine];
    if (fixScriptString.length > 0) {
        [JPEngine evaluateScript:fixScriptString];
    }
    [MDFelix fixIt];
    [MDFelix evalString:fixScriptString];
}

@end
