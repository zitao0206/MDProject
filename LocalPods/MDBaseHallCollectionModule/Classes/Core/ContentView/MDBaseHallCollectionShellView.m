//
//  MDBaseHallCollectionShellView.m
//  MDProject
//
//  Created by Leon0206 on 2018/4/15.
//

#import "MDBaseHallCollectionShellView.h"
#import <AKOCommonToolsKit/AKOCommonToolsKit.h>
#import "MDBaseCollectionCellModuleLayout.h"
#import "MDBaseCollectionCellModule.h"

#define ModuleKey(index) [NSString stringWithFormat:@"%@",@(index)]

@interface MDBaseHallCollectionShellView()<UICollectionViewDataSource, UICollectionViewDelegate, MDBaseCollectionCellModuleDelegate>

@end

@implementation MDBaseHallCollectionShellView

#pragma mark - Setters Methods


- (void)setDelegate:(id)delegate
{
    _delegate = delegate;
    [self registerCellModules];
}

- (void)setModel:(id)model
{
    _model = model;
    if (model) {
        [self addSubview:[self.delegate loadCollectionView]];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
}

#pragma mark - Register and Load Methods

- (void)registerCellModules
{
   
}

#pragma mark - UICollectionViewDataSource and UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(0, 0);
}

//footer的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}

//header的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}

//每个section的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return [self.delegate contentViewEdgeInsets];
}

//每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return [self.delegate minimumInteritemSpacing];
}

//每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return [self.delegate minimumLineSpacing];
}

//cell显示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate collectionView:collectionView didSelectItemAtIndexPath:indexPath];
}

#pragma mark - MDBaseCollectionCellModuleDelegate

- (void)reLayoutCellModuleWith:(NSIndexPath *)indexPath
{
    [UIView performWithoutAnimation:^{
//        [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
        [self.collectionView reloadData];
    }];
}

#pragma mark - Setters and Getters

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}

- (ReactiveBlackBoard *)blackBoard
{
    if(nil == _blackBoard) {
        _blackBoard = [[ReactiveBlackBoard alloc] init];
    }
    return _blackBoard;
}

@end
