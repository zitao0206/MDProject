//
//  MDBaseCollectionCellModuleLayout.h
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define ModuleHeight(h)  [MDBaseCollectionCellModuleLayout layoutWithH:h]
#define ModuleSize(w, h)  [MDBaseCollectionCellModuleLayout layoutWithW:w H:h]
#define ModuleLayout(x, y, w, h)  [MDBaseCollectionCellModuleLayout layoutWithX:x Y:y W:w H:h]

@interface MDBaseCollectionCellModuleLayout : NSObject
@property(nonatomic, assign) CGFloat x;
@property(nonatomic, assign) CGFloat y;
@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGFloat height;

+ (MDBaseCollectionCellModuleLayout *)layoutWithH:(CGFloat)h;

+ (MDBaseCollectionCellModuleLayout *)layoutWithW:(CGFloat)w H:(CGFloat)h;

+ (MDBaseCollectionCellModuleLayout *)layoutWithX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h;

@end

NS_ASSUME_NONNULL_END
