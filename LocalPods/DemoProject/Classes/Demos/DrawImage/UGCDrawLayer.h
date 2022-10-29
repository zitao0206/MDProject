//
//  UGCDrawLayer.h
//  Pods
//
//  Created by Johnny on 3/18/17.
//
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface UGCDrawLayer : NSObject

@property (nonatomic, assign)   CGRect frame;

@property (nonatomic, assign)   CGSize size;
@property (nonatomic, assign)   CGPoint center;

@property (nonatomic, assign)   CGFloat width;
@property (nonatomic, assign)   CGFloat height;
@property (nonatomic, assign)   CGFloat left;
@property (nonatomic, assign)   CGFloat right;
@property (nonatomic, assign)   CGFloat top;
@property (nonatomic, assign)   CGFloat buttom;
@property (nonatomic, assign)   CGFloat centerX;
@property (nonatomic, assign)   CGFloat centerY;


@property (nonatomic, assign)   CGFloat alpha;
@property (nonatomic, strong)   UIColor *backgroundColor;
@property (nonatomic, readonly) NSArray<UGCDrawLayer *> *subLayers;

@property (nonatomic, assign)   CGSize shadowOffset;
@property (nonatomic, assign)   CGFloat shadowBlur;
@property (nonatomic, strong)   UIColor *shadowColor;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)addSubLayer:(UGCDrawLayer *)layer;

- (void)layoutSubLayer;

- (void)sizeToFit;

- (UIImage *)drawWitchScale:(CGFloat)scale;

- (void)drawWithContext:(CGContextRef)context withScale:(NSInteger)scale;

@end
