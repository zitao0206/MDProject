//
//  MDBaseHallCollectionView.m
//  MDProject
//
//  Created by lizitao on 2018/4/15.
//

#import "MDBaseHallCollectionView.h"
#import "MDBaseHallContentCollectionView.h"
#import "MDBaseCollectionModuleDelegate.h"

@interface MDBaseHallCollectionView()<MDBaseCollectionModuleDelegate>

@property (nonatomic, strong) MDBaseHallContentCollectionView *hallContentView;

@end

@implementation MDBaseHallCollectionView

#pragma mark - System Methods

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.hallContentView];
    }
    return self;
}

- (void)setModel:(id)model
{
    _model = model;
    if (_model != nil) {
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.hallContentView.frame = self.bounds;
}

#pragma mark - MDBaseCollectionModuleDelegate Methods

/***须子类重写***/
- (NSArray *)cellModules
{
    return @[];
}

/***需子类重写***/
- (UIEdgeInsets)contentViewEdgeInsets
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

/***需子类重写***/
- (CGFloat)minimumInteritemSpacing
{
    return 0.0;
}

/***需子类重写***/
- (CGFloat)minimumLineSpacing
{
    return 0.0;
}

#pragma mark - Setters and Getters

- (MDBaseHallContentCollectionView *)hallContentView
{
    if (!_hallContentView) {
        _hallContentView = [[MDBaseHallContentCollectionView alloc]initWithFrame:self.bounds];
        _hallContentView.delegate = self;
    }
    return _hallContentView;
}

@end
