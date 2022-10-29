//
//  MDSDWebImageViewController.m
//  MDProject
//
//  Created by Leon0206 on 2018/8/19.
//  Copyright © 2018年 Leon0206. All rights reserved.
//

#import "MDSDWebImageViewController.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageDownloader.h"
#import "SDImageCache.h"

@interface MDSDWebImageViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation MDSDWebImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 100, 200, 200)];
    self.imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.imageView];

    NSURL *url = [NSURL URLWithString:@"https://avatars2.githubusercontent.com/u/22806992?s=460&v=4"];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFill];
//    [self.imageView sd_setImageWithURL:url completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//        NSData *imageData = UIImageJPEGRepresentation(image, (CGFloat)1.0);
//        [[SDImageCache sharedImageCache] storeImageDataToDisk:imageData forKey:@"image_from_network"];
//
//    }];
    
    UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:@"image_from_network"];
  
    self.imageView.image = image;
  self.view.backgroundColor = [UIColor whiteColor];
}

@end
