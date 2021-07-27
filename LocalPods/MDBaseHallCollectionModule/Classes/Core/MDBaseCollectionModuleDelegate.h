//
//  MDBaseHallProtocol.h
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>
 
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, MDBaseCollectionType) {
    MDBaseCollectionTypeDetail = 0, //详情页
    MDBaseCollectionTypeList = 1, //列表
};

@protocol MDBaseCollectionModuleDelegate <NSObject>

/***需子类重写，默认Detail***/
- (MDBaseCollectionType)collectionType;
/***须子类重写***/
- (NSArray *)cellModules;
/***须子类重写***/
- (NSArray *)cellModule2Model;

/***需子类重写***/
- (UIEdgeInsets)contentViewEdgeInsets;
/***需子类重写***/
- (CGFloat)minimumInteritemSpacing;
/***需子类重写***/
- (CGFloat)minimumLineSpacing;
/***子类可重写***/
- (UICollectionView *)loadCollectionView;
/***需子类重写***/
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
