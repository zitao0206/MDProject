//
//  MDDemoBaseViewController.m
//  MDProject
//
//  Created by Leon0206 on 2018/2/22.
//  Copyright © 2018年 Leon0206. All rights reserved.
//

#import "MDDemoBaseViewController.h"
#import "MDTestBaseView.h"
#import "XYBaseModuleModel.h"

@interface MDDemoBaseViewController ()
@property (nonatomic, strong) MDTestBaseView *testBaseView;
@end

@implementation MDDemoBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.testBaseView = [[MDTestBaseView alloc]initWithFrame:CGRectMake(30, 100, 300, 400)];
    self.testBaseView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.testBaseView];
    XYBaseModuleModel *model = [XYBaseModuleModel new];
    model.title = @"hello";
    self.testBaseView.model = model;
}

@end
