//
//  UGCDrawLayer.m
//  Pods
//
//  Created by Johnny on 3/18/17.
//
//

#import "UGCDrawLayer.h"

#import <QuartzCore/QuartzCore.h>

@interface UGCDrawLayer()

@property (nonatomic, strong, readonly) NSMutableArray<UGCDrawLayer *> *internalSubLayer;

@end


@implementation UGCDrawLayer

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super init]) {
        _frame = frame;
        _alpha = 1;
        _internalSubLayer = [NSMutableArray new];
    }
    return self;
}

- (NSArray<UGCDrawLayer *> *)subLayers {
    return [self.internalSubLayer copy];
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
}

- (CGPoint)center {
    return CGPointMake(self.size.width / 2 + self.frame.origin.x, self.size.height / 2 + self.frame.origin.y);
}

- (void)setCenter:(CGPoint)center {
    self.left = center.x - self.width / 2;
    self.top = center.y - self.height / 2;
}

- (CGFloat)width {
    return self.size.width;
}

- (void)setWidth:(CGFloat)width {
    self.size = CGSizeMake(width, self.height);
}

- (CGFloat)height {
    return self.size.height;
}

- (void)setHeight:(CGFloat)height {
    self.size = CGSizeMake(self.width, height);
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left {
    self.frame = CGRectMake(left, self.top, self.width, self.height);
}

- (CGFloat)right {
    return self.left + self.width;
}

- (void)setRight:(CGFloat)right {
    self.left = right - self.width;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top{
    self.frame = CGRectMake(self.left, top, self.width, self.height);
}

- (CGFloat)buttom {
    return self.top + self.height;
}

- (void)setButtom:(CGFloat)buttom {
    self.top = buttom - self.height;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.centerY);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.centerX, centerY);
}


- (void)addSubLayer:(UGCDrawLayer *)layer {
    if (layer) {
        [self.internalSubLayer addObject:layer];
    }
}

- (void)layoutSubLayer
{
    
}

- (void)sizeToFit{
}

- (UIImage *)drawWitchScale:(CGFloat)scale
{
    [self layoutSubLayer];
   
    
    [self sizeToFit];
    
    NSUInteger width = (NSUInteger)self.frame.size.width * scale;
    NSUInteger height = (NSUInteger)self.frame.size.height * scale;
    if (width == 0 || height == 0) return nil;

    CGContextRef context = CGBitmapContextCreate(NULL, width, height, 8, width * 4, CGColorSpaceCreateDeviceRGB(), kCGBitmapByteOrder32Big | kCGImageAlphaPremultipliedLast);
    if (!context) return nil;
    

    CGContextTranslateCTM(context, 0, height);
    CGContextScaleCTM(context, scale, -scale);
    
    CGColorRef backColor = self.backgroundColor.CGColor;
    if (!self.backgroundColor) backColor = [UIColor whiteColor].CGColor;
    CGContextSetFillColorWithColor(context, backColor);
    CGContextFillRect(context, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    [self drawWithContext:context withScale:scale];
    if (self.shadowColor) {
        CGContextSetShadowWithColor(context, self.shadowOffset, self.shadowBlur, self.shadowColor.CGColor);
    }
    CGImageRef image = CGBitmapContextCreateImage(context);
    if (!image) {
        CGContextRelease(context);
        return nil;
    }
    UIImage *result = [UIImage imageWithCGImage:image];
    CGImageRelease(image);
    CGContextRelease(context);
    return result;
}

- (void)drawWithContext:(CGContextRef)context withScale:(NSInteger)scale
{
   
    [self.internalSubLayer enumerateObjectsUsingBlock:^(UGCDrawLayer * _Nonnull layer, NSUInteger idx, BOOL * _Nonnull stop) {
        CGLayerRef cgLayer = CGLayerCreateWithContext(context, CGSizeApplyAffineTransform(layer.frame.size, CGAffineTransformMakeScale(scale, scale)), NULL);
        if (!layer) return;
        CGContextRef subLayerContext = CGLayerGetContext(cgLayer);
        CGColorRef backColor = layer.backgroundColor.CGColor;
        if (!layer.backgroundColor) backColor = [UIColor whiteColor].CGColor;
        CGContextScaleCTM(subLayerContext, scale, scale);
        CGContextSetFillColorWithColor(subLayerContext, backColor);
        CGContextFillRect(subLayerContext, CGRectMake(0, 0, layer.frame.size.width * scale, layer.frame.size.height * scale));
        [layer drawWithContext:subLayerContext withScale:scale];
        CGContextSaveGState(context);
        CGContextSetAlpha(context, layer.alpha);
        if (layer.shadowColor) {
            CGContextSetShadowWithColor(context, layer.shadowOffset, layer.shadowBlur, layer.shadowColor.CGColor);
        }
        CGContextDrawLayerInRect(context, layer.frame, cgLayer);
        CGContextRestoreGState(context);
        
        CGLayerRelease(cgLayer);
    }];
}

@end
