//
//  UGCDrawTextLayer.m
//  DrawLayerTest
//
//  Created by Johnny on 3/19/17.
//  Copyright © 2017 Johnny. All rights reserved.
//

#import "UGCDrawTextLayer.h"
#import <CoreText/CoreText.h>

@interface UGCDrawTextLayer ()

@property (nonatomic, assign) BOOL isNeedToken;

@end

@implementation UGCDrawTextLayer

- (instancetype)initWithText:(NSAttributedString *)text {
    if (self = [self initWithFrame:CGRectZero]) {
        _text = text;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _text = nil;
        _numberOfLines = 0;
        _isNeedToken = NO;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setNumberOfLines:(NSUInteger)numberOfLines
{
    _numberOfLines = numberOfLines;
}

- (void)customSizeToFit
{
    if (_text.length && self.size.width && self.size.height) {
        _text = [[NSAttributedString alloc] initWithString:[self sizeToFit:_text.string size:self.size] attributes:[self obtainAttributes]];
        
    }
}

- (NSString *)sizeToFit:(NSString *)str size:(CGSize)size
{
    if ([self isOverSize:str limitSize:size font:[self obtainFont]]) {
        NSString *strTmp = [str stringByAppendingString:@"..."];
        while ([self isOverSize:strTmp limitSize:size font:[self obtainFont]] && (str.length-1)) {
            str = [str substringToIndex:str.length - 1];
            strTmp = [str stringByAppendingString:@"..."];
        }
        return strTmp;
    }
    return str;
}

- (NSDictionary<NSString *, id> *)obtainAttributes
{
    NSRange range = NSMakeRange(0, _text.length);
    NSDictionary *dic = [_text attributesAtIndex:0 effectiveRange:&range];
    
    return dic;
}

- (UIFont *)obtainFont
{
    return [[self obtainAttributes] objectForKey:NSFontAttributeName];
}

- (CGFloat)obtainLineSpace
{
    return [[[self obtainAttributes] objectForKey:NSParagraphStyleAttributeName] lineSpacing];
}

- (BOOL)isOverSize:(NSString *)s limitSize:(CGSize)size font:(UIFont *)font
{
    return (size.height < [self content:s limitSize:CGSizeMake(size.width, MAXFLOAT) font:font].height);
}

- (CGSize)content:(NSString *)s limitSize:(CGSize)size font:(UIFont *)font
{
    CGSize retSize = [s boundingRectWithSize:size
                                     options:
                      NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:font}
                                     context:nil].size;
    
    return retSize;
}

- (void)sizeToFit
{
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self.text);
    if (!frameSetter) return;
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, self.text.length), CFAutorelease(CGPathCreateWithRect(CGRectMake(0, 0, self.width, CGFLOAT_MAX), NULL)), NULL);
    CFArrayRef allLines = CTFrameGetLines(frame);
    if (self.numberOfLines == 0 || CFArrayGetCount(allLines) <= self.numberOfLines) {
        CGSize size = CTFramesetterSuggestFrameSizeWithConstraints(frameSetter, CFRangeMake(0, self.text.length), NULL, CGSizeMake(self.width, CGFLOAT_MAX), NULL);
        self.size = CGSizeMake(size.width, size.height);
        return;
    }
    if (self.numberOfLines == 1) {
        CGSize size = CTFramesetterSuggestFrameSizeWithConstraints(frameSetter, CFRangeMake(0, self.text.length), NULL, CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX), NULL);
        self.size = CGSizeMake(size.width, size.height);
        return;
    }
    self.isNeedToken = YES;
    CGFloat kHeight = 0.0;
    for (CFIndex i = 0; i < self.numberOfLines; i++) {
        CTLineRef line = CFArrayGetValueAtIndex(allLines, i);
        CGRect lineRect = CTLineGetBoundsWithOptions(line, 0);
        if (i == 0 || i == (self.numberOfLines - 1)) {
            kHeight += fabs(lineRect.origin.y);
        }
        kHeight += lineRect.size.height;
    }
    kHeight += [self obtainLineSpace] * (self.numberOfLines - 1);
    self.height = kHeight;
    self.size = CGSizeMake(self.width, self.height);
}

- (void)drawWithContext:(CGContextRef)context withScale:(NSInteger)scale
{
    if (!self.text.length) {
        [super drawWithContext:context withScale:scale];
        return;
    }
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self.text);
    if (!frameSetter) {
        [super drawWithContext:context withScale:scale];
        return;
    }
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, self.text.length), CFAutorelease(CGPathCreateWithRect(CGRectMake(0, 0, self.width, self.height), NULL)), NULL);
    
    if (!frameSetter) {
        CFRelease(frameSetter);
        [super drawWithContext:context withScale:scale];
        return;
    }
    CGContextTranslateCTM(context, 0, self.height);
    CGContextScaleCTM(context, 1, -1);
    CGContextSaveGState(context);
    [self drawTokenLinesWithContext:context frame:frame];
    CGContextRestoreGState(context);
    CFRelease(frame);
    CFRelease(frameSetter);
    [super drawWithContext:context withScale:scale];
}

- (void)drawTokenLinesWithContext:(CGContextRef)context frame:(CTFrameRef)frame
{
    CFArrayRef allLines = CTFrameGetLines(frame);
    NSUInteger kShowCount = self.numberOfLines < CFArrayGetCount(allLines)?self.numberOfLines: CFArrayGetCount(allLines);
    CGFloat offsetY = 0.0;
    for (CFIndex i = 0; i < kShowCount; i++) {
        CTLineRef line = CFArrayGetValueAtIndex(allLines, i);
        CGRect lineRect = CTLineGetBoundsWithOptions(line, 0);
        //调整坐标系
        if (i == 0) {
            CGContextSetTextPosition(context, lineRect.origin.x, self.height - lineRect.size.height);
            offsetY = self.height - lineRect.origin.y - lineRect.size.height;
            self.height += lineRect.size.height;
        } else {
            CGContextSetTextPosition(context, lineRect.origin.x, offsetY - (lineRect.size.height + [self obtainLineSpace]) * i);
            self.height += lineRect.size.height + [self obtainLineSpace];
        }
        NSRange lastLineRange = NSMakeRange(CTLineGetStringRange(line).location,CTLineGetStringRange(line).length);
        NSMutableAttributedString *newStr = [[NSMutableAttributedString alloc] initWithAttributedString:[self.text attributedSubstringFromRange:lastLineRange]];
        if ((i == kShowCount - 1) && self.isNeedToken) {
            NSAttributedString *tokenStr = [[NSAttributedString alloc] initWithString:@"\u2026" attributes:[self obtainAttributes]];
            [newStr appendAttributedString:tokenStr];
            CTLineRef newLastLine = CTLineCreateWithAttributedString((CFAttributedStringRef)newStr);
            CGRect rect = CTLineGetBoundsWithOptions(newLastLine, 0);
            while (rect.size.width > self.width) {
                [newStr deleteCharactersInRange:NSMakeRange(newStr.length - 2, 1)];
                newLastLine = CTLineCreateWithAttributedString((CFAttributedStringRef)newStr);
                rect = CTLineGetBoundsWithOptions(newLastLine, 0);
            }
            CTLineDraw(newLastLine, context);
        } else {
            CTLineDraw(line, context);
        }
    }
}

@end
