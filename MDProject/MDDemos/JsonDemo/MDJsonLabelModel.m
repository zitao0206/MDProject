//
//  MDJsonLabelModel.m
//  MDProject
//
//  Created by lizitao on 2017/6/7.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDJsonLabelModel.h"

@implementation MDJsonLabelContentModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error
{
    self = [super initWithDictionary:dictionaryValue error:error];
    if (!self) return nil;
    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"textColor":@"textColor",@"textSize":@"textSize",@"text":@"text"};
}

@end

@implementation MDJsonLabelModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error
{
    self = [super initWithDictionary:dictionaryValue error:error];
    if (!self) return nil;
    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"backgroundColor":@"backgroundColor",@"lineSpacing":@"lineSpacing",@"textList":@"textList"};
}

@end
