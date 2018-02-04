//
//  MDFather.m
//  MDProject
//
//  Created by lizitao on 2018/2/3.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDFather.h"

@interface Z : NSObject
@property (nonatomic, strong) NSString *name;
@end
@implementation Z

+ (void)load
{
    
}

@end

@interface MDMother : NSObject
@property (nonatomic, strong) NSString *name;
@end
@implementation MDMother

+ (void)load
{
    
}

@end


@interface MDFather ()
@property (nonatomic, strong) NSString *name;
@end
@implementation MDFather
+ (void)load
{
    
    
    
}

- (id)init
{
    if(self = [super init]) {
        _name = @"lizitao";
    }
    return self;
}


- (void)printName
{
    NSLog(@"hello world...");
}

+ (void)printTitle
{
    NSLog(@"+hello world...");
}

- (void)printName:(NSString *)name
{
    NSLog(@"base run with %@", name);
}

- (void)printIndex:(NSInteger)index
{
    NSLog(@"index run with %@", @(index));
}

@end


