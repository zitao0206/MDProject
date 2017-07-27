//
//  MDCoreImageFilterViewController.m
//  MDProject
//
//  Created by lizitao on 2017/7/27.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDCoreImageFilterViewController.h"
#import "UIView+ResizeFrame.h"

@interface MDCoreImageFilterViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UISegmentedControl *segment;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) NSUInteger selectIndex;

@end

@implementation MDCoreImageFilterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"desktop" ofType:@"png"];
    self.image = [[UIImage alloc] initWithContentsOfFile:imagePath];
    self.imageView  = [[UIImageView alloc] initWithImage:self.image];
    self.imageView.width = self.view.width - 30;
    self.imageView.height = self.imageView.width * 2 / 3;
    [self.view addSubview:self.imageView];
    
    NSArray *array = [NSArray arrayWithObjects:@"旧色调",@"高斯模糊",nil];
    self.segment = [[UISegmentedControl alloc]initWithItems:array];
    self.segment.selectedSegmentIndex = 0;
    [self.segment addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    self.segment.height = 30;
    self.segment.width = self.view.width - 60;
    [self.view addSubview:self.segment];
    
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, self.view.width - 60, 40)];
    self.slider.minimumValue = 0.0;//下限
    self.slider.maximumValue = 1.0;//上限
    self.slider.value = 0.0;//开始默认值
    [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    self.slider.continuous = NO;//当放开手., 值才确定下来
    [self.view addSubview:self.slider];
    
    self.label = [[UILabel alloc]init];
    self.label.font = [UIFont systemFontOfSize:16];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.backgroundColor = self.view.backgroundColor;
    [self.view addSubview:self.label];
    
}

- (void)change:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0) {
        self.selectIndex = 0;
        [self filterSepiaTone];
    } else if (sender.selectedSegmentIndex == 1) {
        self.selectIndex = 1;
        [self filterGaussianBlur];
    } else if (sender.selectedSegmentIndex == 2) {
        NSLog(@"2");
    } else if (sender.selectedSegmentIndex == 3) {
        NSLog(@"3");
    }
}

-(void)sliderValueChanged:(UISlider *)paramSender
{
    if ([paramSender isEqual:self.slider]) {
        if (self.selectIndex == 0) {
            [self filterSepiaTone];
        }
        if (self.selectIndex == 1) {
            [self filterGaussianBlur];
        }
        
    }
}

//旧色调
- (void)filterSepiaTone
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *cImage = [CIImage imageWithCGImage:[self.image CGImage]];
    CIImage *result;
    CIFilter *sepiaTone = [CIFilter filterWithName:@"CISepiaTone"];
    [sepiaTone setValue:cImage forKey:@"inputImage"];
    double value = [self.slider value];
    NSString *text = [[NSString alloc] initWithFormat:@"旧色调 Intensity:%.2f",value];
    self.label.text = text;
    [self.label sizeToFit];
    [sepiaTone setValue:[NSNumber numberWithFloat:value] forKey:@"inputIntensity"];
    result = [sepiaTone valueForKey:@"outputImage"];
    CGImageRef imageRef = [context createCGImage:result fromRect:CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height)];
    UIImage *image = [[UIImage alloc]initWithCGImage:imageRef];
    self.imageView.image = image;
    
}

//高斯模糊
- (void)filterGaussianBlur
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *cImage = [CIImage imageWithCGImage:[self.image CGImage]];
    CIImage *result;
    CIFilter *sepiaTone = [CIFilter filterWithName:@"CIGaussianBlur"];
    [sepiaTone setValue:cImage forKey:@"inputImage"];
    double value = [self.slider value] * 10;
    NSString *text = [[NSString alloc] initWithFormat:@"高斯模糊 Radus:%.2f",value];
    self.label.text = text;
    [self.label sizeToFit];
    [sepiaTone setValue:[NSNumber numberWithFloat:value] forKey:@"inputRadius"];
    result = [sepiaTone valueForKey:@"outputImage"];
    CGImageRef imageRef = [context createCGImage:result fromRect:CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height)];
    UIImage *image = [[UIImage alloc]initWithCGImage:imageRef];
    self.imageView.image = image;
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.imageView.left = 15;
    self.imageView.top = 75;
    self.segment.top = self.imageView.bottom + 30;
    self.segment.left = 30;
    self.slider.top = self.segment.bottom + 30;
    self.slider.left = 30;
    self.label.top = self.slider.bottom + 30;
    self.label.centerX = self.view.centerX;
}


@end
