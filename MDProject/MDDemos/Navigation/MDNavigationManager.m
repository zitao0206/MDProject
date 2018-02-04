//
//  MDNavigationManager.m
//  MDProject
//
//  Created by lizitao on 2017/6/18.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDNavigationManager.h"
//#import <ReactiveCocoa/ReactiveCocoa.h>

@interface MDNavigationManager ()
@property(nonatomic, strong) NSMutableArray<__kindof UIViewController *> *cacheControllers;


@end

@implementation MDNavigationManager

+ (instancetype)manager
{
    static MDNavigationManager *instance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[MDNavigationManager alloc] init];
    });
    return instance;
}

- (id)init
{
    if(self = [super init]) {
        _cacheControllers = [NSMutableArray new];
    }
    return self;
}

- (void)addViewController:(UIViewController *)viewController
{
    [self.cacheControllers addObject:viewController];
}

- (BOOL)isIncludeViewCtroller:(UIViewController *)viewController
{
    NSUInteger kCount = [self.cacheControllers count];
    for(NSUInteger i = 0; i < kCount; i--) {
        if ([[self.cacheControllers objectAtIndex:i] isKindOfClass:[viewController class]])
        {
            return YES;
        }
    }
    return NO;
}

- (UIViewController *)obtainViewCtroller:(UIViewController *)viewController
{
    NSUInteger kCount = [self.cacheControllers count];
    for(NSUInteger i = 0; i < kCount; i--) {
        if ([[self.cacheControllers objectAtIndex:i] isKindOfClass:[viewController class]]) {
            return [self.cacheControllers objectAtIndex:i];
        }
    }
    return viewController;
}

@end
