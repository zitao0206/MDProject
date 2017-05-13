//
//  MDDemoMiddleModuleView.m
//  MDProject
//
//  Created by lizitao on 2017/5/13.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDDemoMiddleModuleView.h"

@implementation MDDemoMiddleModuleView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

- (void)reloadModelData:(id)model
{
    
}

- (void)relayoutSubviews:(CGFloat)viewWidth
{
    self.frame = CGRectMake(0, 0, viewWidth, 100.0);
}

@end
