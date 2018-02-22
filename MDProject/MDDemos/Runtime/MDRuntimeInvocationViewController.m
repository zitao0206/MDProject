//
//  MDRuntimeInvocationViewController.m
//  MDProject
//
//  Created by lizitao on 2018/2/10.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDRuntimeInvocationViewController.h"
#import "MDSon.h"
#import <objc/message.h>

@interface MDRuntimeInvocationViewController ()

@end

@implementation MDRuntimeInvocationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    MDSon *son = [MDSon new];
    {
        SEL selector = @selector(printName);
        NSMethodSignature *methodSign = [son methodSignatureForSelector:selector];
        NSInvocation *methodInvocation = [NSInvocation invocationWithMethodSignature:methodSign];
        [methodInvocation setTarget:son];
        [methodInvocation setSelector:selector];
        [methodInvocation invoke];
    }
    {
        SEL selector = @selector(printTitle);
        NSMethodSignature *methodSign = [MDSon instanceMethodSignatureForSelector:selector];
        NSInvocation *methodInvocation = [NSInvocation invocationWithMethodSignature:methodSign];
        [methodInvocation setTarget:[son class]];
        [methodInvocation setSelector:selector];
        [methodInvocation invoke];
    }
    {
        SEL selector = @selector(printName:);
        NSMethodSignature *methodSign = [son methodSignatureForSelector:selector];
        NSInvocation *methodInvocation = [NSInvocation invocationWithMethodSignature:methodSign];
        [methodInvocation setTarget:son];
        [methodInvocation setSelector:selector];
        NSString *name = @"hello invocation...";
        //这里的Index要从2开始，以为0跟1已经被占据了，分别是self（target）,selector(_cmd)
        [methodInvocation setArgument:&name atIndex:2];
        [methodInvocation invoke];
    }
    
#pragma clang diagnostic pop

}

- (void)printName
{
    NSLog(@"hello world123...");
}

@end
