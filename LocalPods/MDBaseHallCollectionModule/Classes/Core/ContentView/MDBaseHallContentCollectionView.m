//
//  MDBaseHallContentCollectionView.m
//  MDProject
//
//  Created by lizitao on 2018/4/15.
//

#import "MDBaseHallContentCollectionView.h"
#import <MDCommonKit/MDCommonKit.h>
#import "MDBaseCollectionCellModuleLayout.h"
#import "MDBaseCollectionCellModule.h"

#define ModuleKey(index) [NSString stringWithFormat:@"%@",@(index)]

@interface MDBaseHallContentCollectionView()<UICollectionViewDataSource, UICollectionViewDelegate, MDBaseCollectionCellModuleDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray<MDBaseCollectionCellModule *> *allCellModels;

@property (nonatomic, strong) NSMutableArray<MDBaseCollectionCellModuleLayout *> *moduleLayouts;

@end

@implementation MDBaseHallContentCollectionView

#pragma mark - System Methods

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
    }
    return self;
}

- (void)setDelegate:(id)delegate
{
    _delegate = delegate;
    [self registerCellModules];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
}

#pragma mark - Register and Load Methods

- (void)registerCellModules
{
    NSArray *cellModules = [self.delegate cellModules];
    
    [cellModules enumerateObjectsUsingBlock:^(id  _Nonnull cellModel, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([cellModel isKindOfClass:[NSArray class]]) {
            NSArray *values = (NSArray *)cellModel;
            if ([values count] > 0) {
                //register Class
                id cellObj = values.firstObject;
                if ([cellObj isKindOfClass:[NSString class]]) {
                    Class cls = NSClassFromString(cellObj);
                    if ([cls isSubclassOfClass:[MDBaseCollectionCellModule class]]) {
                        [self.collectionView registerClass:cls forCellWithReuseIdentifier:cellObj];
                    }
                }
                //obtain Layout
                id layoutObj = values.lastObject;
                if ([layoutObj isKindOfClass:[MDBaseCollectionCellModuleLayout class]]) {
                    [self.moduleLayouts addObject:layoutObj];
                }
            }
        }
    }];
}

//- (void)loadCellModulesData
//{
//    [self.allCellModels enumerateObjectsUsingBlock:^(__kindof MDBaseCollectionCellModule * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if ([obj conformsToProtocol:@protocol(MDBaseCollectionCellModuleCommonDelegate)]) {
//            [obj loadCellModuleData:ModuleKey(idx)];
//        }
//    }];
//}

- (NSArray *)obtainCellModuleItemWithIndex:(NSInteger)index
{
    if ([self.delegate cellModules].count <= 0) {
        return nil;
    }
    if (index > [self.delegate cellModules].count || index < 0) {
        return nil;
    }
    id cellModel = [[self.delegate cellModules] objectAtIndex:index];
    
    if ([cellModel isKindOfClass:[NSArray class]]) {
        
        NSArray *values = (NSArray *)cellModel;
        if ([values count] > 0) {
            return values;
        }
    }
    return nil;
}

- (NSString *)obtainCellModuleIdentifierWithIndex:(NSInteger)index
{
    NSArray *values = [self obtainCellModuleItemWithIndex:index];
    
    if (values.count <= 0) {
        return nil;
    }
    
    id cellObj = values.firstObject;
    
    if ([cellObj isKindOfClass:[NSString class]]) {
        return cellObj;
    }
    return nil;
}

#pragma mark - UICollectionViewDataSource and UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.delegate cellModules].count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MDBaseCollectionCellModuleLayout *layout = [self.moduleLayouts objectAtIndex:indexPath.row];
    if (layout.width <= 0.0) {
        layout.width = self.width - [self.delegate contentViewEdgeInsets].left - [self.delegate contentViewEdgeInsets].right;
    }
    if (layout.height <= 0.0) {
        layout.height = self.height - [self.delegate contentViewEdgeInsets].top - [self.delegate contentViewEdgeInsets].bottom;
    }
    return CGSizeMake(layout.width, layout.height);
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
    __kindof MDBaseCollectionCellModule *contentCell = nil;//[self.allCellModels objectAtIndex:indexPath.row];
    if (!contentCell) {
        NSString *reuseIdentifier = [self obtainCellModuleIdentifierWithIndex:indexPath.row];
        contentCell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        contentCell.blackBoard = self.blackBoard;
        contentCell.delegate = self;
        contentCell.moduleIndexPath = indexPath;
        MDBaseCollectionCellModuleLayout *layout = [self.moduleLayouts objectAtIndex:indexPath.row];
        contentCell.layout = layout;
        if ([contentCell conformsToProtocol:@protocol(MDBaseCollectionCellModuleCommonDelegate)]) {
            [contentCell loadCellModuleData:ModuleKey(indexPath.row)];
        }
    }
    return contentCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
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
        _collectionView.backgroundColor = [[UIColor brownColor]colorWithAlphaComponent:0.2];
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

- (NSMutableArray *)moduleLayouts
{
    if(!_moduleLayouts) {
        _moduleLayouts = [[NSMutableArray alloc] init];
    }
    return _moduleLayouts;
}

- (NSMutableArray *)allCellModels
{
    if(!_allCellModels) {
        _allCellModels = [[NSMutableArray alloc] init];
    }
    return _allCellModels;
}

@end
