//
//  MDBaseHallCollectionView.m
//  MDProject
//
//  Created by Leon0206 on 2018/4/15.
//

#import "MDBaseHallCollectionView.h"
#import "MDBaseHallCollectionDetailView.h"
#import "MDBaseHallCollectionListView.h"
#import "MDBaseHallCollectionShellView.h"

@interface MDBaseHallCollectionView()

@property (nonatomic, strong) MDBaseHallCollectionShellView *hallContentView;

@end

@implementation MDBaseHallCollectionView

#pragma mark - System Methods

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (MDBaseCollectionTypeList == [self collectionType]) {
            self.hallContentView = [self loadListContentView];
        } else {
            self.hallContentView = [self loadDetailContentView];
        }
        [self addSubview:self.hallContentView];
    }
    return self;
}

- (void)setModel:(id)model
{
    _model = model;
    if (_model != nil) {
        self.hallContentView.model = model;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.hallContentView.frame = self.bounds;
}

#pragma mark - MDBaseCollectionModuleDelegate Methods

- (MDBaseCollectionType)collectionType
{
    return MDBaseCollectionTypeDetail;
}

/***须子类重写***/
- (nonnull NSArray *)cellModules
{
    return @[];
}
/***须子类重写***/
- (nonnull NSArray *)cellModule2Model
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

- (UICollectionView *)loadCollectionView
{
    return self.hallContentView.collectionView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Load Content View

- (MDBaseHallCollectionShellView *)loadDetailContentView
{
    if (!_hallContentView) {
        _hallContentView = [[MDBaseHallCollectionDetailView alloc]initWithFrame:self.bounds];
        _hallContentView.delegate = self;
    }
    return _hallContentView;
}

- (MDBaseHallCollectionShellView *)loadListContentView
{
    if (!_hallContentView) {
        _hallContentView = [[MDBaseHallCollectionListView alloc]initWithFrame:self.bounds];
        _hallContentView.delegate = self;
    }
    return _hallContentView;
}

@end
