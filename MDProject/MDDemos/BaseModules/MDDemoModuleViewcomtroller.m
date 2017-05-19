//
//  MDDemoModuleViewcomtroller.m
//  MDProject
//
//  Created by lizitao on 2017/5/13.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDDemoModuleViewcomtroller.h"
#import "UIView+ResizeFrame.h"

@interface MDDemoModuleViewcomtroller ()

@end

@implementation MDDemoModuleViewcomtroller


- (void)viewDidLoad
{
    [super viewDidLoad];
 
}


- (NSArray *)loadContentViews
{
    return @[@"MDDemoHeadModuleView",
             @"MDDemoMiddleModuleView",
             @"MDDemoBottomModuleView",
             @"MDDemoHeadModuleView",
             @"MDDemoMiddleModuleView",
             @"MDDemoBottomModuleView",
             @"MDDemoHeadModuleView",
             @"MDDemoMiddleModuleView",
             @"MDDemoBottomModuleView"
             ];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    UIImage *image = [self convertViewToImage:self.contentView];
    [self loadImageFinished:image];
}


- (void)loadImageFinished:(UIImage *)image
{
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
}

- (UIImage *)convertViewToImage:(UIView *)v
{
    @autoreleasepool
    {
        CGSize s = CGSizeMake(v.width, v.height);
        UIGraphicsBeginImageContextWithOptions(s, NO, 2);
        [v.layer renderInContext:UIGraphicsGetCurrentContext()];
        v.layer.contents = nil;
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
