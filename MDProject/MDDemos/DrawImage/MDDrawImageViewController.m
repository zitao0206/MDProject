//
//  MDDrawImageViewController.m
//  MDProject
//
//  Created by lizitao on 2017/4/19.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDDrawImageViewController.h"
#import "UIView+ResizeFrame.h"
#import <QuartzCore/QuartzCore.h>
#import "UGCDrawTextLayer.h"
#import "MDQuartzView.h"

@interface MDDrawImageViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UGCDrawTextLayer *textLayer;
@property (nonatomic, strong) MDQuartzView *textView;
@end

@implementation MDDrawImageViewController

- (BOOL)handleWithURLAction:(MDURLAction *)urlAction
{
    self.image = [urlAction anyObjectForKey:@"image"];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     NSString *stringTemp = @"中山公园世纪大道人民公园浦东大道";
    self.bgView = [UIView new];
    self.bgView.width = 300;
    self.bgView.height = 200;
    self.label = [[UILabel alloc]initWithFrame:CGRectZero];
    self.label.font = [UIFont systemFontOfSize:9];
    self.label.width = 60;
    self.label.numberOfLines = 0;
    self.label.backgroundColor = [UIColor greenColor];
    self.label.text = stringTemp;
    [self.view addSubview:self.label];
//    [self.view addSubview:self.bgView];
 
//    self.textLayer = [self obtainStrWithTitle:stringTemp And:[UIFont systemFontOfSize:9]];
//    self.textLayer.width = 5;
//    self.textLayer.height = 500;
//    NSUInteger num = 2;
//    self.textLayer.numberOfLines = num;
//    self.label.numberOfLines = num;
//    self.image = [self.textLayer drawWitchScale:2];
//    self.imageView = [[UIImageView alloc]initWithImage:self.image];

//    [self.view addSubview:self.imageView];
    
//    self.textView = [[MDQuartzView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
//    [self.view addSubview:self.textView];
    {
      
        self.bgImageView.frame = CGRectMake(0, 40, 200, 300);
        self.bgImageView = [[UIImageView alloc]initWithImage:self.image];
        [self.view addSubview:self.bgImageView];
        
//        self.image = [self convertViewToImage:self.bgScrollView];
        
    }
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 400)];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(320, 2000);
    [self.scrollView addSubview:self.bgImageView];
    [self.view addSubview:self.scrollView];

}

- (void)viewDidAppear:(BOOL)animated
{
    
}

- (UIImage*)convertViewToImage:(UIView*)v
{
    CGSize s =  CGSizeMake(v.bounds.size.width + 20, v.bounds.size.height + 60);
    UIGraphicsBeginImageContextWithOptions(s, NO, 2);
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  
    UIGraphicsEndImageContext();
    return image;
}

- (UGCDrawTextLayer *)obtainStrWithTitle:(NSString *)str And:(UIFont *)font
{
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing = 5;
    return [[UGCDrawTextLayer alloc] initWithText:[[NSAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName : font, NSForegroundColorAttributeName: [UIColor blackColor],NSParagraphStyleAttributeName:style}]];
}

- (CGSize)obtainSize:(NSString *)str
{
    CGSize suggestSize = [str boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size;
    return suggestSize;
}

+ (UIImage *)imageWithView:(UIView *)v
{
    CGSize s = v.bounds.size;
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (NSAttributedString *)obtainStrWith:(NSString *)str
{
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing = 1;
    return [[NSAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20], NSForegroundColorAttributeName: [UIColor yellowColor],NSParagraphStyleAttributeName:style}];
}



- (void)viewDidLayoutSubviews
{
    [self.label sizeToFit];
    self.label.top = 0;
    self.label.left = 15;
    [self.bgImageView sizeToFit];
    self.bgImageView.top = 100;
    self.bgImageView.left = 15;
    self.bgImageView.backgroundColor = [UIColor redColor];
}

@end
