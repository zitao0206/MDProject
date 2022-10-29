//
//  TestBlockViewController.h
//  MDProject
//
//  Created by Leon0206 on 2017/8/10.
//  Copyright © 2017年 Leon0206. All rights reserved.
//

#import <MDPageMaster/MDPageMaster.h>

@interface TestBlockViewController : MDPageMasterViewController

- (instancetype)initWithBlock:(void (^)())block;

@end
