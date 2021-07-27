//
//  MDBaseHallCollectionViewController.m
//  MDProject
//
//  Created by lizitao on 2018/4/15.
//

#import "MDBaseHallCollectionViewController.h"
#import "MDBaseHallCollectionDetailView.h"
#import "MDBaseHallCollectionListView.h"
#import "MDBaseHallCollectionShellView.h"

@interface MDBaseHallCollectionViewController()

@property (nonatomic, strong) MDBaseHallCollectionShellView *hallContentView;

@end

@implementation MDBaseHallCollectionViewController

#pragma mark - System Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if (MDBaseCollectionTypeList == [self collectionType]) {
        self.hallContentView = [self loadListContentView];
    } else {
        self.hallContentView = [self loadDetailContentView];
    }
    [self.view addSubview:self.hallContentView];
}

- (void)setModel:(id)model
{
    _model = model;
    if (_model != nil) {
        self.hallContentView.model = model;
    }
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.hallContentView.frame = self.view.bounds;
}

#pragma mark - MDBaseCollectionModuleDelegate Methods

- (MDBaseCollectionType)collectionType
{
    return MDBaseCollectionTypeDetail;
}

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
        _hallContentView = [[MDBaseHallCollectionDetailView alloc]initWithFrame:self.view.bounds];
        _hallContentView.delegate = self;
    }
    return _hallContentView;
}

- (MDBaseHallCollectionShellView *)loadListContentView
{
    if (!_hallContentView) {
        _hallContentView = [[MDBaseHallCollectionListView alloc]initWithFrame:self.view.bounds];
        _hallContentView.delegate = self;
    }
    return _hallContentView;
}

@end
