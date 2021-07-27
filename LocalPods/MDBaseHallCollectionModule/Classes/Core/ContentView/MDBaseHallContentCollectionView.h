//
//  MDBaseHallContentCollectionView.h
//  MDProject
//
//  Created by lizitao on 2018/4/15.
//

#import "MDBaseCollectionCellModuleLayout.h"
#import "MDBaseCollectionModuleDelegate.h"

@interface MDBaseHallContentCollectionView : UIView

@property (nonatomic, weak) id delegate;
 
@property (nonatomic, strong) ReactiveBlackBoard *blackBoard;

@property (nonatomic, strong) id model;

@end
