//
//  MDFillingView.m
//  MDProject
//
//  Created by lizitao on 2017/7/26.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDFillingView.h"

@implementation MDFillingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
//    [[UIColor brownColor] setFill];
//    UIRectFill(rect);
    
//    [[UIColor whiteColor] setStroke];
//    CGRect frame = CGRectMake(20, 30, 100, 100);
//    UIRectFrame(frame);
    
    
    [self drawCompressImage1];
    
}

//压缩图片方法一
- (void)drawCompressImage1
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"desktop" ofType:@"png"];
    UIImage *myImageObj = [[UIImage alloc] initWithContentsOfFile:imagePath];
    UIImage *result = [UIImage imageWithData:UIImageJPEGRepresentation(myImageObj, 0.5)];
    [self saveImageToPhotos:result];
}

//压缩图片方法二
- (void)drawCompressImage2
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"desktop" ofType:@"png"];
    UIImage *myImageObj = [[UIImage alloc] initWithContentsOfFile:imagePath];
    
    CGFloat ratio = myImageObj.size.height / myImageObj.size.width;
    CGFloat width = 600;
    CGSize size = CGSizeMake(width, width * ratio);
    UIGraphicsBeginImageContext(size);
    [myImageObj drawInRect:CGRectMake(0, 0, size.width , size.height)];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    [self saveImageToPhotos:result];
    UIGraphicsEndImageContext();

}


- (void)saveImageToPhotos:(UIImage*)savedImage
{
    UIImageWriteToSavedPhotosAlbum(savedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}

- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *)contextInfo
{
    NSString *msg = nil ;
    if(error != NULL) {
        msg = @"保存图片失败" ;
    } else {
        msg = @"保存图片成功" ;
    }
}

@end
