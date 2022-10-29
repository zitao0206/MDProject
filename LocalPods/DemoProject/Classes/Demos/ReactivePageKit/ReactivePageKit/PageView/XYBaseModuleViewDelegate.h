//
//  XYBaseModuleViewDelegate.h
//  Pods
//
//  Created by Leon0206 on 2018/2/1.
//

#ifndef XYBaseModuleViewDelegate_h
#define XYBaseModuleViewDelegate_h

@class RACSubject;
@protocol XYBaseModuleViewDelegate <NSObject>

@required
- (void)loadModuleViewData:(id)model;
- (void)layoutModuleViewWithWidth:(CGFloat)width;

@end

#endif /* XYBaseModuleViewDelegate_h */
