//
//  XYReactBasePageViewController.m
//  XYReactivePageKit
//
//  Created by lizitao on 2018/2/1.
//

#import "XYReactBasePageViewController.h"
#import "UIView+ResizeFrame.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "XYBaseModuleView.h"
#import "XYBaseModuleViewDelegate.h"
@interface XYReactBasePageViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;
@end

@implementation XYReactBasePageViewController

- (void)dealloc
{
    [self disposeAllModuleViewsSignal];
}

- (void)setModel:(id)model
{
    _model = model;
    if (_model != nil) {
        [self refreshAllModuleViews];
    }
}

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.scrollView = [UIScrollView new];
    self.scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.scrollView];
    self.scrollView.bounces = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.contentView = [UIView new];
    self.contentView.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:self.contentView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadContentModuleViews];
}

//刷新所有模块
- (void)refreshAllModuleViews
{
    [self loadContentModulesData];
    [self layoutModuleViews];
}

//刷新某一模块
- (void)refreshModuleViewsWithIndex:(NSUInteger)index
{
     if (index >= self.contentView.subviews.count) return;
     __kindof XYBaseModuleView * obj = [self.contentView.subviews objectAtIndex:index];
     if ([obj conformsToProtocol:@protocol(XYBaseModuleViewDelegate)]) {
        [obj loadModuleViewData:self.model];
        [obj layoutModuleViewWithWidth:[self screenWidth]];
        [self relayoutModuleViewsWithIndex:index];
    }
}

//加载所有ModuleView
- (void)loadContentModuleViews
{
    for (NSString *obj in [self moduleViews]) {
        [self.contentView addSubview:[NSClassFromString(obj) new]];
    }
}

//分发数据并绑定height变化监测
- (void)loadContentModulesData
{
    [self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof XYBaseModuleView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.moduleIndex = idx;
        if ([obj conformsToProtocol:@protocol(XYBaseModuleViewDelegate)]) {
            [obj loadModuleViewData:self.model];
        }
    }];
    [self bindModuleViewsHeight];
}

/***须子类重写***/
- (NSArray *)moduleViews
{
    return @[];
}

- (void)bindModuleViewsHeight
{
    __block RACSignal *signal = [RACSubject subject];
    [self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof XYBaseModuleView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        RACSubject *s = obj.heightSignal;
        if (idx == 0) {
            signal = s;
        } else {
            signal = [signal merge:s];
        }
    }];
    @weakify(self);
    [[[signal distinctUntilChanged] skip:0] subscribeNext:^(id x) {
        @strongify(self);
        [self relayoutModuleViewsWithIndex:[x integerValue]];
    }];
}

//所有模块布局
- (void)layoutModuleViews
{
    __block CGFloat layoutOffestY = 0.0;
    @weakify(self);
    [self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        @strongify(self);
        if ([obj conformsToProtocol:@protocol(XYBaseModuleViewDelegate)]) {
            [obj layoutModuleViewWithWidth:[self screenWidth]];
            obj.top = layoutOffestY;
            obj.left = 0;
            layoutOffestY = obj.bottom + [self spaceBetweenModuleViews];
        }
    }];
    self.contentView.frame = CGRectMake(0, 0, self.view.width, layoutOffestY);
    self.scrollView.contentSize = CGSizeMake(self.view.width, layoutOffestY);
}

//指定模块的布局刷新
- (void)relayoutModuleViewsWithIndex:(NSUInteger)index
{
    __block CGFloat layoutOffestY = [self.contentView.subviews objectAtIndex:index].bottom;
    NSUInteger location = index + 1;
    NSRange range = NSMakeRange(location, self.contentView.subviews.count - location);
    [[self.contentView.subviews subarrayWithRange:range] enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.top = layoutOffestY + [self spaceBetweenModuleViews];
        layoutOffestY = obj.bottom;
    }];
    self.contentView.frame = CGRectMake(0, 0, self.view.width, layoutOffestY);
    self.scrollView.contentSize = CGSizeMake(self.view.width, layoutOffestY);
}

- (void)disposeAllModuleViewsSignal
{
    [self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof XYBaseModuleView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj conformsToProtocol:@protocol(XYBaseModuleViewDelegate)]) {
            RACSubject *s = obj.heightSignal;
            [s sendCompleted];
        }
    }];
}

/***子类可重写***/
- (CGFloat)spaceBetweenModuleViews
{
    return 0.0;
}

- (CGFloat)screenWidth
{
    return [UIScreen mainScreen].bounds.size.width;
}

- (CGFloat)screenHeight
{
    return [UIScreen mainScreen].bounds.size.height;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.scrollView.frame = CGRectMake(0, 0, self.view.width, [self screenHeight]);
    self.contentView.top = 0;
    self.contentView.left = 0;
    self.contentView.width = self.scrollView.width;
}

@end
