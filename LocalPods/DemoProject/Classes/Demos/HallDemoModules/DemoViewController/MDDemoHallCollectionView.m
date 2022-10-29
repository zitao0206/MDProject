//
//  MDDemoHallCollectionView.m
//  MDProject
//
//  Created by Leon0206 on 2018/4/15.
//

#import "MDDemoHallCollectionView.h"

@interface MDDemoHallCollectionView()
 
@end

@implementation MDDemoHallCollectionView

#pragma mark - System Methods

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

#pragma mark - SubClass Methods

- (MDBaseCollectionType)collectionType
{
    return MDBaseCollectionTypeList;
}

- (NSArray *)cellModule2Model
{
    return @[
        @[@"MainSubTopCollectionViewCellModule",@"MainTopModel", ModuleSize(0, 60)],
        @[@"MainSubMiddleCollectionViewCellModule",@"MainMiddleModel", ModuleSize(0, 60)],
    ];
}

- (NSArray *)cellModules
{
    CGFloat width = 0.0;
    return @[
        @[@"MainSubTopCollectionViewCellModule", ModuleSize(width, 60)],
//        @[@"MDBaseSpaceCellModule", ModuleLayout(width, 5)],
        @[@"MainSubMiddleCollectionViewCellModule", ModuleSize(width, 60)],
//        @[@"MDBaseSpaceCellModule", ModuleLayout(width, 5)],
        @[@"MainSubBottomCollectionViewCellModule", ModuleSize(width, 60)],
//        @[@"MDBaseSpaceCellModule", ModuleLayout(width, 5)],
        @[@"MainSubTopCollectionViewCellModule", ModuleSize(width, 60)],
//        @[@"MDBaseSpaceCellModule", ModuleLayout(width, 5)],
        @[@"MainSubTopCollectionViewCellModule", ModuleSize(width, 60)],
    ];
}

- (UIEdgeInsets)contentViewEdgeInsets
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGFloat)minimumInteritemSpacing
{
    return 10.0;
}

- (CGFloat)minimumLineSpacing
{
    return 5.0;
}

- (UICollectionView *)loadCollectionView
{
    UICollectionView *c = [super loadCollectionView];
    c.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
    c.showsVerticalScrollIndicator = YES;
    return c;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
