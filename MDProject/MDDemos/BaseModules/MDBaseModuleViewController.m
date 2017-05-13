//
//  MDBaseModuleViewController.m
//  MDProject
//
//  Created by lizitao on 2017/5/13.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDBaseModuleViewController.h"
#import "MDBaseModuleView.h"
#import "UIView+ResizeFrame.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface MDBaseModuleViewController ()<UIScrollViewDelegate>
//views
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;

//model
@property (nonatomic, strong) id model;

@end

@implementation MDBaseModuleViewController

- (instancetype)init
{
    if (self = [super init]) {
    
    }
    return self;
}

- (void)setModel:(id)model
{
    _model = model;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadContentSubviews];
}

- (void)loadContentSubviews
{
    self.scrollView = [UIScrollView new];
    self.scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.scrollView];
    self.scrollView.bounces = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
   
    self.contentView = [UIView new];
    [self.scrollView addSubview:self.contentView];
    
    for (NSString *obj in [self loadContentViews]) {
        [self.contentView addSubview:[NSClassFromString(obj) new]];
    }
    [self reloadContentSubviewsData];
    [self relayoutContentSubviews];
}

- (NSArray *)loadContentViews
{
    return @[];
}

- (void)reloadContentSubviewsData
{
    [self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[MDBaseModuleView class]]) {
            [obj reloadModelData:self.model];
        }
    }];
}

- (void)relayoutContentSubviews
{
    __block CGFloat layoutOffestY = 0.0;
    [self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[MDBaseModuleView class]]) {
            [obj relayoutSubviews:[self contentViewWidth]];
            obj.top = layoutOffestY;
            obj.left = 15.f;
            layoutOffestY = obj.bottom + 15;
        }
    }];
    self.contentView.frame = CGRectMake(0, 0, layoutOffestY, self.view.width);
    self.scrollView.contentSize = CGSizeMake(self.view.width, layoutOffestY);
}

- (void)relayoutContentView
{
    __block CGFloat layoutOffestY = 0.0;
    [self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[MDBaseModuleView class]]) {
            obj.top = layoutOffestY;
            obj.left = 15.f;
            layoutOffestY = obj.bottom + 15;
        }
    }];
    self.contentView.frame = CGRectMake(0, 0, layoutOffestY, self.view.width);
    self.scrollView.contentSize = CGSizeMake(self.view.width, layoutOffestY);
}

- (CGFloat)screenWidth
{
    return [UIScreen mainScreen].bounds.size.width;
}

- (CGFloat)contentViewWidth
{
    return [self screenWidth] - 30;
}

- (CGFloat)showHeight
{
    return [self screenHeight];
}

- (CGFloat)screenHeight
{
    return [UIScreen mainScreen].bounds.size.height;
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.scrollView.frame = CGRectMake(0, 0, self.view.width, [self showHeight]);
    self.contentView.top = 0;
    self.contentView.left = 0;
    self.contentView.width = self.scrollView.width;
}

#pragma mark - scrollview delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

}

- (void)naviViewProcession:(UIScrollView *)scrollView
{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
