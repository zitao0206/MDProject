//
//  MDHotfixViewController.m
//  MDProject
//
//  Created by lizitao on 2018/12/24.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDHotfixViewController.h"

@interface MDHotfixViewController ()

@end

@implementation MDHotfixViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self insteadMethod];
//    NSLog(@"--------------->%@",@([self changeReturnValue]));
//    [self changeParamValue:100];
//    [self insertBeforeMethod];
    NSLog(@"---->%@",@([self insertAfterMethod]));
//    [self insertAfterMethod];
}

- (void)insteadMethod
{
    NSLog(@"insteadMethod...");
}

- (NSInteger)changeReturnValue
{
    NSLog(@"changeReturnValue...");
    return 100;
}

- (void)changeParamValue:(NSInteger)param
{
    NSLog(@"changeParamValue:...%@",@(param));
}

- (void)insertBeforeMethod
{
    NSLog(@"insertBeforeMethod...");
}

- (NSUInteger)insertAfterMethod
{
    NSLog(@"insertAfterMethod...");
    
    
    return 100;
}

@end
