//
//  MDHopeStateMachingViewController.m
//  MDProject
//
//  Created by Leon0206 on 2018/4/15.
//

#import "MDHopeStateMachingViewController.h"

@implementation MDHopeStateMachingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    [self.childStates enterState:NSClassFromString(@"MDHopeZeroState")];
    self.view.backgroundColor = [UIColor whiteColor];
}

//first test
- (NSArray *)childViewStates
{
    return @[
             @"MDHopeZeroState",
             @"MDHopeFirstState",
             @"MDHopeSecondState",
             @"MDHopeThirdState",
             ];
}

//second test
- (NSArray *)childViewStates1
{
    return @[
             @"MDHopeZeroState",
             @"MDHopeFirstState",
             @"MDHopeSecondState",
             @"MDHopeThirdState",
             ];
}

@end
