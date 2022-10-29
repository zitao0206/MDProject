//
//  MDMultiRoleViewController.m
//  MDProject
//
//  Created by Leon0206 on 2017/6/28.
//  Copyright © 2017年 Leon0206. All rights reserved.
//

#import "MDMultiRoleViewController.h"
#import <MDCommonKit/MDCommonKit.h>
#import <EasyLayout/EasyLayout.h>
#import "NMLKMultiRoleView.h"

@interface MDMultiRoleViewController ()
@property(nonatomic, strong) NMLKMultiRoleView *nameRoleView;
@end

@implementation MDMultiRoleViewController

- (void)dealloc
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.nameRoleView];
    
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    [arr addObject:@[@"labelType",@"杭州"]];
    [arr addObject:@[@"mixType",@"上海",[UIImage imageNamed:@"launch.jpg"]]];
    [arr addObject:@[@"imageType",[UIImage imageNamed:@"desktop.png"]]];
    [arr addObject:@[@"labelType",@"深圳"]];
    
    [self.nameRoleView reloadItemsData:arr];
    [self.nameRoleView setNeedsLayout];
}


- (void)viewDidLayoutSubviews
{
    self.nameRoleView.centerY = self.view.height / 2.0;
    self.nameRoleView.centerX = self.view.width / 2.0;
}

- (NMLKMultiRoleView *)nameRoleView
{
    if (!_nameRoleView) {
        _nameRoleView = [[NMLKMultiRoleView alloc]initWithMultiRoleConfig:^(NMLKMultiRoleViewConfig * _Nonnull roleConfig) {
            roleConfig.direction = NMLKMultiRoleHorizontal; //水平布局
            roleConfig.isFixedSize = NO;
            roleConfig.backgroundColor = [UIColor clearColor];
            roleConfig.space = 6;
            NSDictionary *itemsConfig = nil;
            {
                NMLKMultiRoleItemViewConfig *labelConfig = [NMLKMultiRoleItemViewConfig new];
                labelConfig.itemType = NMLKMultiRoleItemLabelType;
                labelConfig.titleLabelConfig.textColor = [UIColor whiteColor];
                labelConfig.titleLabelConfig.font = [UIFont systemFontOfSize:22 weight:UIFontWeightSemibold];
                labelConfig.titleLabelConfig.maxWidth = 154;
                labelConfig.titleLabelConfig.fixedHeight = 30;
                
                NMLKMultiRoleItemViewConfig *imageConfig = [NMLKMultiRoleItemViewConfig new];
                imageConfig.itemType = NMLKMultiRoleItemImageType;
                imageConfig.itemSpace = 6;
                imageConfig.imageViewConfig.maxWidth = 154;
                imageConfig.imageViewConfig.fixedHeight = 18;
                itemsConfig = @{@"labelType":labelConfig,@"imageType":imageConfig};
            }
            roleConfig.itemsConfig = itemsConfig;
        }];
    }
    return _nameRoleView;
}

@end
