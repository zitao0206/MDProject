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
#import "MDEasyHotFixTool.h"
#import "Felix.h"
#import "MDBanksy.h"

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
    NSString *corePath = [[NSBundle mainBundle] pathForResource:@"MDEasyHotFixTool" ofType:@"js"];
    NSString *coreScriptString = [NSString stringWithContentsOfFile:corePath encoding:NSUTF8StringEncoding error:nil];

    
    NSString *txtPath = [[NSBundle mainBundle] pathForResource:@"bugfix_jspatch" ofType:@"js"];
    NSString *fixScriptString = [NSString stringWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
//    [JPEngine evaluateScript:fixScriptString];
    
    NSString *txtPath1 = [[NSBundle mainBundle] pathForResource:@"bugfix_banksy" ofType:@"js"];
    NSString *fixScriptString1 = [NSString stringWithContentsOfFile:txtPath1 encoding:NSUTF8StringEncoding error:nil];
//    [MDBanksy banksy];
//    [MDBanksy registJSKeyword];
//    [MDBanksy evalString:fixScriptString1];
    
    [Felix fixIt];
    [Felix evalString:fixScriptString1];
    
//    [MDFelix fixIt];
//    [MDFelix evalString:fixScriptString1];
//
//    [[MDEasyHotFixTool tool] startInitContext];
//    [[MDEasyHotFixTool tool] evaluateScript:fixScriptString];
}

@end
