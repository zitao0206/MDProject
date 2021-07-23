//
//  MDBaseViewController.h
//  Nova
//
//  Created by lizitao on 12-5-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYUrlAction.h"

@interface UIViewController (MDURLAction)

- (BOOL)handleWithURLAction:(XYUrlAction *)urlAction;

@end

@interface MDBaseViewController : UIViewController

+ (BOOL)isSingleton;

@end


