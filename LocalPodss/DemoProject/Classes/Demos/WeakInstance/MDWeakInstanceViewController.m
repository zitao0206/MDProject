//
//  MDWeakInstanceViewController.m
//  MDProject
//
//  Created by Leon0206 on 2017/6/28.
//  Copyright © 2017年 Leon0206. All rights reserved.
//

#import "MDWeakInstanceViewController.h"
#import "MDBaseWeakInstanceManager.h"
#import <MDCommonKit/MDCommonKit.h>
#import <EasyLayout/EasyLayout.h>
#import "MDInstanceManager.h"
#import "MDWeakInstanceManager.h"

@interface MDWeakInstanceViewController ()<MDBaseWeakInstanceManagerDelegate, MDWeakInstanceManagerDelegate>
@property (nonatomic, strong) UIButton *btn;
//@property (nonatomic, strong) MDBaseWeakInstanceManager *instance;

@property (nonatomic, strong) MDWeakInstanceManager *weakInstanceManager;

@end

@implementation MDWeakInstanceViewController

- (void)dealloc
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [MDBaseWeakInstanceManager buildInstance:self identifier:@"A"];
    
    [MDWeakInstanceManager buildInstance:self];
   
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.size = CGSizeMake(80, 40);
    [btn setTitle:@"点击这里" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [btn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:btn];
    self.btn = btn;
    self.view.backgroundColor = [UIColor whiteColor];
    
    MDInstanceManager *instanceManager = [MDInstanceManager shareInstance];
    NSLog(@"-->%@",instanceManager);
//    NSLog(@"-->%@",[[MDInstanceManager alloc]init]);
//    NSLog(@"-->%@",[instanceManager copy]);
//    NSLog(@"-->%@",[instanceManager mutableCopy]);
    
    
}

- (void)clickAction
{
    
}

#pragma mark -- MDBaseWeakInstanceManagerDelegate

//- (void)buildInstance:(MDBaseWeakInstanceManager *)instance identifier:(NSString *)identifier
//{
//    if ([identifier isEqualToString:@"A"]) {
//        self.instance = instance;
//    }
//}

- (void)assignInstance:(MDWeakInstanceManager *)instance
{
    self.weakInstanceManager = instance;
}

- (void)viewDidLayoutSubviews
{
    self.btn.centerY = self.view.height / 2.0;
    self.btn.centerX = self.view.width / 2.0;
}

@end
