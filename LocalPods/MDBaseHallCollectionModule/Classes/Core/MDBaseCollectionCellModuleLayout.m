//
//  MDBaseCollectionCellModuleLayout.m
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import "MDBaseCollectionCellModuleLayout.h"

@implementation MDBaseCollectionCellModuleLayout

- (instancetype)init
{
    if (self = [super init]) {
        _x = 0.0;
        _y = 0.0;
        _width = 0.0;
        _height = 0.0;
    }
    return self;
}

+ (MDBaseCollectionCellModuleLayout *)layoutWithH:(CGFloat)h
{
    MDBaseCollectionCellModuleLayout *layout = [[MDBaseCollectionCellModuleLayout alloc]init];
    layout.height = h;
    return layout;
}

+ (MDBaseCollectionCellModuleLayout *)layoutWithW:(CGFloat)w H:(CGFloat)h
{
    MDBaseCollectionCellModuleLayout *layout = [[MDBaseCollectionCellModuleLayout alloc]init];
    layout.width = w;
    layout.height = h;
    return layout;
}

+ (MDBaseCollectionCellModuleLayout *)layoutWithX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h
{
    MDBaseCollectionCellModuleLayout *layout = [[MDBaseCollectionCellModuleLayout alloc]init];
    layout.x = x;
    layout.y = y;
    layout.width = w;
    layout.height = h;
    return layout;
}

@end
