//
//  MDAssociateObject.m
//  MDProject
//
//  Created by Leon0206 on 2018/2/21.
//  Copyright © 2018年 Leon0206. All rights reserved.
//

#import "MDAssociateObject.h"
#import "MDCacheTestModel.h"
#import <objc/runtime.h>

@implementation MDAssociateObject

- (void)dealloc
{
    NSLog(@"------------>dealloc");
}

- (void)print
{
    NSLog(@"------------>");
}

@end
