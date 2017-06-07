//
//  MDJsonModel.m
//  MDProject
//
//  Created by lizitao on 2017/6/7.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDJsonModel.h"

@implementation MDJsonModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error
{
    self = [super initWithDictionary:dictionaryValue error:error];
    if (!self) return nil;
    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"age":@"age",@"ID":@"ID",@"name":@"name",@"sex":@"sex"};
}

@end
