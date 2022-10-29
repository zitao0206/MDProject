//
//  MDQuartzDrawViewController.m
//  MDProject
//
//  Created by Leon0206 on 2017/7/26.
//  Copyright © 2017年 Leon0206. All rights reserved.
//

#import "MDQuartzDrawViewController.h"
#import "MDFillingView.h"

@interface MDQuartzDrawViewController ()

@end

@implementation MDQuartzDrawViewController

+ (void)load
{
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    MDFillingView *fillingView = [[MDFillingView alloc]initWithFrame:CGRectMake(15, 100, self.view.frame.size.width - 30, 600)];
    [self.view addSubview:fillingView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
