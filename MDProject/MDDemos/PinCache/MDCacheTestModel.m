//
//  MDCacheTestModel.m
//  MDProject
//
//  Created by lizitao on 2018/6/20.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDCacheTestModel.h"

@implementation MDCacheTestModel
- (instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        if (aDecoder == nil) {
            return self;
        }
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeObjectForKey:@"age"];
        self.male = [aDecoder decodeObjectForKey:@"male"];
        self.address = [aDecoder decodeObjectForKey:@"address"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.age forKey:@"age"];
    [aCoder encodeObject:self.male forKey:@"male"];
    [aCoder encodeObject:self.address forKey:@"address"];
}
@end
