//
//  MDBaseViewController.h
//  Nova
//
//  Created by lizitao on 12-5-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDURLAction.h"

@interface UIViewController (MDURLAction)

- (BOOL)handleWithURLAction:(MDURLAction *)urlAction;

@end

@interface MDBaseViewController : UIViewController

+ (BOOL)isSingleton;

@end


