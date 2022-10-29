//
//  TestBlockViewController.m
//  MDProject
//
//  Created by Leon0206 on 2017/8/10.
//  Copyright © 2017年 Leon0206. All rights reserved.
//

#import "TestBlockViewController.h"

@interface TestBlockViewController ()

@end

@implementation TestBlockViewController

- (instancetype)init
{
    return nil;
}

- (instancetype)initWithBlock:(void (^)())block
{
    if (!block) return nil;
    if (self = [super init]) {
        if (block) {
         //   block();
        }
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}


@end
