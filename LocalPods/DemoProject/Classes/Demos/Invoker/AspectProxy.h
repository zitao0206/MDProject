//
//  AspectProxy.h
//  MDProject
//
//  Created by Leon0206 on 2018/2/21.
//  Copyright © 2018年 Leon0206. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Invoker.h"

@interface AspectProxy : NSProxy
@property (nonatomic, strong) id proxyTarget;
@property (nonatomic, strong) id <Invoker> invoker;
@property (nonatomic, readonly) NSMutableArray *selectors;

- (id)initWithObject:(id)object andInvoker:(id <Invoker>)invoker;
- (id)initWithObject:(id)object selectors:(NSArray *)selectors andInvoker:(id<Invoker>)invoker;
- (void)registerSelector:(SEL)selector;
@end
