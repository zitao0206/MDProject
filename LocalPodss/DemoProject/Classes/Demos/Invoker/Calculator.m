//
//  Calculator.m
//  MDProject
//
//  Created by Leon0206 on 2018/2/21.
//  Copyright © 2018年 Leon0206. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator
- (NSNumber *)sumAdd1:(NSNumber *)add1 add2:(NSNumber *)add2
{
    return [NSNumber numberWithInteger:([add1 integerValue] + [add2 integerValue])];
}

- (NSNumber *)sumAdd1:(NSNumber *)add1 :(NSNumber *)add2
{
    return [NSNumber numberWithInteger:([add1 integerValue] + [add2 integerValue])];
}

@end
