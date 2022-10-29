//
//  MMDJsonMappers.m
//  MDProject
//
//  Created by Leon0206 on 2017/6/14.
//  Copyright © 2017年 Leon0206. All rights reserved.
//

#import "MDJsonMappers.h"

@implementation MDJsonMappers

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (NSString *)obtainViewByType:(NSString *)key
{
    return [self allViewMappers][key];
    
}

- (NSDictionary *)allViewMappers
{
    return @{
             @"view":@"MDJsonViewModel",
             @"label":@"MDJsonLabelModel",
             @"imageView":@"MDJsonImageViewModel"
             };
}
@end
