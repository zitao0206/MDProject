//
//  MDURLElement.m
//  MDProject
//
//  Created by lizitao on 17/3/28.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDURLElement.h"

@implementation MDURLElement
{
    NSString *_classString;
}

+ (MDURLElement *)patternWithClassName:(NSString *)className withKey:(NSString *)key
{
    return [[self alloc] initWithString:className withKey:key];
}

- (id)initWithString:(NSString *)string withKey:(NSString *)key
{
    self = [super init];
    if (self)
    {
        if (string.length < 1 || key.length < 1)
        {
            return nil;
        }
        _key = key;
        _classString = string;
    }
    return self;
}

- (Class)targetClass
{
    if (_classString.length < 1)
    {
        return NULL;
    }
    return NSClassFromString(_classString);
}

@end
