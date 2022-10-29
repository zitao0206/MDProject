//
//  AspectProxy.m
//  MDProject
//
//  Created by Leon0206 on 2018/2/21.
//  Copyright © 2018年 Leon0206. All rights reserved.
//

#import "AspectProxy.h"

@implementation AspectProxy

- (id)initWithObject:(id)object selectors:(NSArray *)selectors andInvoker:(id<Invoker>)invoker
{
    _proxyTarget = object;
    _invoker = invoker;
    _selectors = [_selectors mutableCopy];
    return self;
}

- (id)initWithObject:(id)object andInvoker:(id <Invoker>)invoker
{
    return [self initWithObject:object selectors:nil andInvoker:invoker];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    return [self.proxyTarget methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)inv
{
    if ([self.invoker respondsToSelector:@selector(preInvoke:withTargrt:)]) {
        if (self.selectors != nil) {
            SEL methodSel = [inv selector];
            for (NSValue *selValue in self.selectors) {
                if (methodSel == [selValue pointerValue]) {
                    [[self invoker] preInvoke:inv withTargrt:self.proxyTarget];
                    break;
                }
            }
        }
    } else {
        [[self invoker] preInvoke:inv withTargrt:self.proxyTarget];
    }
    
    [inv invokeWithTarget:self.proxyTarget];
    
    if ([self.invoker respondsToSelector:@selector(postInvoke:withTargrt:)]) {
        if (self.selectors != nil) {
            SEL methodSel = [inv selector];
            for (NSValue *selValue in self.selectors) {
                if (methodSel == [selValue pointerValue]) {
                    [[self invoker] postInvoke:inv withTargrt:self.proxyTarget];
                    break;
                }
            }
        }
    } else {
        [[self invoker] postInvoke:inv withTargrt:self.proxyTarget];
    }
}

- (void)registerSelector:(SEL)selector
{
    NSValue *selValue = [NSValue valueWithPointer:selector];
    [self.selectors addObject:selValue];
}

@end
