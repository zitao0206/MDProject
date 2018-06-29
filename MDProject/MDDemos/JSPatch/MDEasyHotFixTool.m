//
//  MDEasyHotFixTool.m
//  MDProject
//
//  Created by lizitao on 2018/6/25.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDEasyHotFixTool.h"
#import <objc/runtime.h>
#import <objc/message.h>
static JSContext *_context;
static NSString *_regexStr = @"(?<!\\\\)\\.\\s*(\\w+)\\s*\\(";
static NSString *_replaceStr = @".__c(\"$1\")(";
static NSRegularExpression* _regex;
static NSObject *_nullObj;
static NSObject *_nilObj;
static void (^_exceptionBlock)(NSString *log) = ^void(NSString *log) {
    NSCAssert(NO, log);
};
@interface MDEasyHotFixTool ()
@property (nonatomic, strong) JSContext *jsContext;
@end
@implementation MDEasyHotFixTool

+ (MDEasyHotFixTool *)tool
{
    static MDEasyHotFixTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[self alloc] init];
        _context = [[JSContext alloc]init];
    });
    return tool;
}

- (void)startInitContext
{
    _context[@"_OC_defineClass"] = ^(NSString *classDeclaration, JSValue *instanceMethods, JSValue *classMethods) {
        return defineClass(classDeclaration, instanceMethods, classMethods);
    };
    _context[@"dispatch_after"] = ^(double time, JSValue *func) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [func callWithArguments:nil];
        });
    };
    _context[@"add"] = ^(NSInteger a, NSInteger b) {
        NSLog(@"--------%@", @(a + b));
    };
  
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MDEasyHotFixTool" ofType:@"js"];
    if (!path) _exceptionBlock(@"can't find MDEasyHotFixTool.js");
    NSString *jsCore = [[NSString alloc] initWithData:[[NSFileManager defaultManager] contentsAtPath:path] encoding:NSUTF8StringEncoding];
    
    if ([_context respondsToSelector:@selector(evaluateScript:withSourceURL:)]) {
        [_context evaluateScript:jsCore withSourceURL:[NSURL URLWithString:@"MDEasyHotFixTool.js"]];
    } else {
        [_context evaluateScript:jsCore];
    }
}

- (JSValue *)evaluateScript:(NSString *)script
{
    if (script.length < 1) return nil;
    
    if (!_regex) {
        _regex = [NSRegularExpression regularExpressionWithPattern:_regexStr options:0 error:nil];
    }
    NSString *formatedScript = [NSString stringWithFormat:@";(function(){try{\n%@\n}catch(e){_OC_catch(e.message, e.stack)}})();", [_regex stringByReplacingMatchesInString:script options:0 range:NSMakeRange(0, script.length) withTemplate:_replaceStr]];
    @try {
        if ([_context respondsToSelector:@selector(evaluateScript:withSourceURL:)]) {
            return [_context evaluateScript:formatedScript withSourceURL:[NSURL URLWithString:@"main.js"]];
        } else {
            return [_context evaluateScript:formatedScript];
        }
    }
    @catch (NSException *exception) {
        _exceptionBlock([NSString stringWithFormat:@"%@", exception]);
    }
    return nil;
}

static NSDictionary *defineClass(NSString *classDeclaration, JSValue *instanceMethods, JSValue *classMethods)
{
    
    return [NSDictionary new];
}

@end
