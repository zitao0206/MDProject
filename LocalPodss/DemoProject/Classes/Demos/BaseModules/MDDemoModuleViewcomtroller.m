//
//  MDDemoModuleViewcomtroller.m
//  MDProject
//
//  Created by Leon0206 on 2017/5/13.
//  Copyright © 2017年 Leon0206. All rights reserved.
//

#import "MDDemoModuleViewcomtroller.h"
#import <EasyLayout/EasyLayout.h>

@interface MDDemoModuleViewcomtroller ()

@end

@implementation MDDemoModuleViewcomtroller


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (NSArray *)loadContentViews
{
    return @[@"MDDemoHeadModuleView",
             @"MDDemoMiddleModuleView",
             @"MDDemoBottomModuleView",
             ];
}

- (CGFloat)contentViewWidth
{
    return [self screenWidth] - 30;
}

- (CGFloat)spacingBetweenSubviews
{
    return 15.0;
}

- (CGFloat)screenWidth
{
    return [UIScreen mainScreen].bounds.size.width;
}
@end
