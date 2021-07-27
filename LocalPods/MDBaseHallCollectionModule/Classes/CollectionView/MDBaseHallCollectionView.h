//
//  MDBaseHallCollectionView.h
//  MDProject
//
//  Created by lizitao on 2018/4/15.
//

#import "MDBaseCollectionCellModuleLayout.h"

@interface MDBaseHallCollectionView : UIView

@property (nonatomic, strong) ReactiveBlackBoard *blackBoard;

@property (nonatomic, strong) id model;

- (UIEdgeInsets)contentViewEdgeInsets;

- (CGFloat)minimumLineSpacing;

- (CGFloat)minimumInteritemSpacing;

@end
