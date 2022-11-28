//
//  MDBaseHallCollectionListView.m
//  MDProject
//
//  Created by Leon0206 on 2018/4/15.
//

#import "MDBaseHallCollectionListView.h"
#import <AKOCommonToolsKit/AKOCommonToolsKit.h>
#import "MDBaseCollectionCellModuleLayout.h"
#import "MDBaseCollectionCellModule.h"

#define ModuleKey(index) [NSString stringWithFormat:@"%@",@(index)]

@interface MDBaseHallCollectionListView()

@property (nonatomic, strong) NSMutableDictionary<NSString *, NSString *> *allCellModels;

@property (nonatomic, strong) NSMutableDictionary<NSString *, MDBaseCollectionCellModuleLayout *> *moduleLayouts;

@end

@implementation MDBaseHallCollectionListView

#pragma mark - System Methods

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

#pragma mark - Register and Load Methods

- (void)registerCellModules
{
    NSArray *cellModules = [self.delegate cellModule2Model];
    
    [cellModules enumerateObjectsUsingBlock:^(id  _Nonnull cellModel, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([cellModel isKindOfClass:[NSArray class]]) {
            NSArray *values = (NSArray *)cellModel;
            if ([values count] == 3) {
                //register Class
                id cellObj = values[0];
                id cellModel = values[1];
                if ([cellObj isKindOfClass:[NSString class]]) {
                    Class cls = NSClassFromString(cellObj);
                    if ([cls isSubclassOfClass:[MDBaseCollectionCellModule class]]) {
                        [self.collectionView registerClass:cls forCellWithReuseIdentifier:cellObj];
                    }
                    if ([cellModel isKindOfClass:[NSString class]]) {
                        [self.allCellModels setValue:cellObj forKey:cellModel];
                    }
                }
                //obtain Layout
                id layoutObj = values.lastObject;
                if ([layoutObj isKindOfClass:[MDBaseCollectionCellModuleLayout class]]) {
                    [self.moduleLayouts setValue:layoutObj forKey:cellModel];
                }
            }
        }
    }];
}

- (MDBaseCollectionCellModuleLayout *)obtainCellModuleLayoutWithIndex:(NSInteger)index
{
    if ([self.model isKindOfClass:[NSArray class]]) {
        NSArray *arr = (NSArray *)self.model;
        if (arr.count <= 0 || index >= arr.count) {
            return nil;
        }
        __kindof NSObject *obj = [arr objectAtIndex:index];
        if (obj) {
            return [self.moduleLayouts valueForKey:NSStringFromClass([obj class])];
        }
    }
    return nil;
}

- (NSString *)obtainCellModuleIdentifierWithIndex:(NSInteger)index
{
    if ([self.model isKindOfClass:[NSArray class]]) {
        NSArray *arr = (NSArray *)self.model;
        if (arr.count <= 0 || index >= arr.count) {
            return nil;
        }
        __kindof NSObject *obj = [arr objectAtIndex:index];
        if (obj) {
            return [self.allCellModels valueForKey:NSStringFromClass([obj class])];
        }
    }
    return nil;
}

#pragma mark - UICollectionViewDataSource and UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([self.model isKindOfClass:[NSArray class]]) {
        NSArray *listData = (NSArray *)self.model;
        return [listData count];
    }
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MDBaseCollectionCellModuleLayout *layout = [self obtainCellModuleLayoutWithIndex:indexPath.row];
    if (!layout) {
        layout = [MDBaseCollectionCellModuleLayout new];
    }
    if (layout.width <= 0.0) {
        layout.width = self.width - [self.delegate contentViewEdgeInsets].left - [self.delegate contentViewEdgeInsets].right;
    }
    if (layout.height <= 0.0) {
        layout.height = self.height - [self.delegate contentViewEdgeInsets].top - [self.delegate contentViewEdgeInsets].bottom;
    }
    return CGSizeMake(layout.width, layout.height);
}

//cell显示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = [self obtainCellModuleIdentifierWithIndex:indexPath.row];
    __kindof MDBaseCollectionCellModule *contentCell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    contentCell.blackBoard = self.blackBoard;
    contentCell.delegate = self;
    contentCell.moduleIndexPath = indexPath;
    contentCell.layout = [self obtainCellModuleLayoutWithIndex:indexPath.row];
    if ([contentCell conformsToProtocol:@protocol(MDBaseCollectionCellModuleCommonDelegate)]) {
        if ([self.model isKindOfClass:[NSArray class]]) {
            NSArray *listData = (NSArray *)self.model;
            if (indexPath.row < listData.count) {
                id data = [listData objectAtIndex:indexPath.row];
                [contentCell loadCellModuleData:data];
            }
        }
    }
    return contentCell;
}

#pragma mark - Setters and Getters

- (NSMutableDictionary *)moduleLayouts
{
    if(!_moduleLayouts) {
        _moduleLayouts = [[NSMutableDictionary alloc] init];
    }
    return _moduleLayouts;
}

- (NSMutableDictionary *)allCellModels
{
    if(!_allCellModels) {
        _allCellModels = [[NSMutableDictionary alloc] init];
    }
    return _allCellModels;
}

@end
