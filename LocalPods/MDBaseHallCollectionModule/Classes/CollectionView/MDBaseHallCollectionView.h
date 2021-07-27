//
//  MDBaseHallCollectionView.h
//  MDProject
//
//  Created by lizitao on 2018/4/15.
//

#import "MDBaseCollectionCellModuleLayout.h"
#import "MDBaseCollectionModuleDelegate.h"

@interface MDBaseHallCollectionView : UIView <MDBaseCollectionModuleDelegate>

@property (nonatomic, strong) ReactiveBlackBoard *blackBoard;

@property (nonatomic, strong) id model;

@end
