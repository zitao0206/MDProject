//
//  MDBaseHallCollectionViewController.h
//  MDProject
//
//  Created by Leon0206 on 2018/4/15.
//

#import <MDPageMaster/MDPageMaster.h>
#import "MDBaseCollectionCellModuleLayout.h"
#import "MDBaseCollectionModuleDelegate.h"

@interface MDBaseHallCollectionViewController : MDPageMasterViewController<MDBaseCollectionModuleDelegate>

@property (nonatomic, strong) ReactiveBlackBoard *blackBoard;

@property (nonatomic, strong) id model;

@end
