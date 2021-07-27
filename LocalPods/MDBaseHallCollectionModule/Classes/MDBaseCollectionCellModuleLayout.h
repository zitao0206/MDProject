//
//  MDBaseCollectionCellModuleLayout.h
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define ModuleLayout(w, h)  [MDBaseCollectionCellModuleLayout layoutWithWidth:w height:h]

@interface MDBaseCollectionCellModuleLayout : NSObject
@property(nonatomic, assign) CGFloat x;
@property(nonatomic, assign) CGFloat y;
@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGFloat height;

+ (MDBaseCollectionCellModuleLayout *)layoutWithX:(CGFloat)x y:(CGFloat)y w:(CGFloat)w h:(CGFloat)h;
+ (MDBaseCollectionCellModuleLayout *)layoutWithWidth:(CGFloat)w height:(CGFloat)h;

@end

NS_ASSUME_NONNULL_END
