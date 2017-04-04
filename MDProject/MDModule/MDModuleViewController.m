//
//  MDModuleViewController.m
//  MDProject
//
//  Created by lizitao on 17/3/12.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDModuleViewController.h"
#import "MDNavigator.h"

@interface MDModuleViewController ()

@end

@implementation MDModuleViewController

- (BOOL)handleWithURLAction:(MDURLAction *)urlAction
{
    NSString *string = [urlAction stringForKey:@"url"];
    NSLog(@"1------->%@",string);
    return YES;
}

+ (BOOL)isSingleton
{
    return NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"VC详情页1";
   
    NSLog(@"----------->%@",self.navigationController.viewControllers);
    
}

@end
