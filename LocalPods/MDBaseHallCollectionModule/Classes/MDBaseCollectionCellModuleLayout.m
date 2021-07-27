//
//  MDBaseCollectionCellModuleLayout.m
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import "MDBaseCollectionCellModuleLayout.h"

@implementation MDBaseCollectionCellModuleLayout

+ (MDBaseCollectionCellModuleLayout *)layoutWithWidth:(CGFloat)w height:(CGFloat)h
{
    MDBaseCollectionCellModuleLayout *moduleSize = [[MDBaseCollectionCellModuleLayout alloc]init];
    
    moduleSize.width = w;
    moduleSize.height = h;
    return moduleSize;
}

+ (MDBaseCollectionCellModuleLayout *)layoutWithX:(CGFloat)x y:(CGFloat)y w:(CGFloat)w h:(CGFloat)h
{
    MDBaseCollectionCellModuleLayout *moduleSize = [[MDBaseCollectionCellModuleLayout alloc]init];
    moduleSize.x = x;
    moduleSize.y = y;
    moduleSize.width = w;
    moduleSize.height = h;
    return moduleSize;
}

@end
