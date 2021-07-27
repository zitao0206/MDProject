//
//  MDBaseHallCollectionViewController.h
//  MDProject
//
//  Created by lizitao on 2018/4/15.
//

#import <MDPageMaster/MDPageMaster.h>
#import "MDBaseCollectionCellModuleLayout.h"

@interface MDBaseHallCollectionViewController : MDPageMasterViewController

@property (nonatomic, strong) ReactiveBlackBoard *blackBoard;

@property (nonatomic, strong) id model;

- (UIEdgeInsets)contentViewEdgeInsets;

- (CGFloat)minimumLineSpacing;

- (CGFloat)minimumInteritemSpacing;

@end
