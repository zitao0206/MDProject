//
//  MDAssociateDemoViewController.h
//  MDHomeProject
//
//  Created by Leon0206 on 2019/9/23.
//

#import "MDPageMasterViewController.h"
#import "MDAssociateObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface MDAssociateObjectViewController : MDPageMasterViewController

@property(nonatomic, strong) MDAssociateObject *associateObject;

- (MDAssociateObject *)obtainAssociateObject;

@end

NS_ASSUME_NONNULL_END
