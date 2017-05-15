//
//  MDBaseViewDelegate.h
//  MDProject
//
//  Created by lizitao on 2017/5/13.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#ifndef MDBaseViewDelegate_h
#define MDBaseViewDelegate_h

@class RACSignal;
@protocol MDBaseViewDelegate <NSObject>

@required
- (void)initViewIndexWith:(NSUInteger)index;
- (void)reloadModelData:(id)model;
- (void)relayoutSubviews:(CGFloat)viewWidth;
- (RACSignal *)signalOfSize;

@end

#endif /* MDBaseViewDelegate_h */
