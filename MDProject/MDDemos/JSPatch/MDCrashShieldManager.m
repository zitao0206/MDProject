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
#import "MDEasyHotFixTool.h"
#import "Felix.h"
#import "MDBanksy.h"
#import "SSZipArchive.h"
#import "NSString+Ext.h"
#import <CommonCrypto/CommonDigest.h>

#define MDZipDefaultCachePath      [((NSString *)NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0]) stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",MDZipEasyDefaultCachePrefix]]
NSString * const MDZipEasyDefaultCachePrefix = @"com.leon.mdeasycache.default";

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
    NSString *mm = @"lizitao8221376";
    NSString *key1 = mm.md5;
    NSString *key2 = [NSString md5:mm];
    NSLog(@"0---------->%@ ",key1);
    NSLog(@"1---------->%@ ",key2);
    
    
    NSString *zipPath = [[NSBundle mainBundle] pathForResource:@"bugfix" ofType:@"zip"];
    NSLog(@"1------>%@",zipPath);
    
    [SSZipArchive unzipFileAtPath:zipPath toDestination:MDZipDefaultCachePath overwrite:YES password:@"lizitao8221376" error:nil];
    NSLog(@"2------->%@",MDZipDefaultCachePath);
    
    NSString *path = [NSString stringWithFormat:@"%@/bugfix",MDZipDefaultCachePath];
    
    NSString *jsContent = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"3------>%@",jsContent);
    [Felix fixIt];
    [Felix evalString:jsContent];
}

- (void)startPatch1
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

//
//    [[MDEasyHotFixTool tool] startInitContext];
//    [[MDEasyHotFixTool tool] evaluateScript:fixScriptString];
}

@end
