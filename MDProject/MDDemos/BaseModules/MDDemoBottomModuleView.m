//
//  MDDemoBottomModuleView.m
//  MDProject
//
//  Created by lizitao on 2017/5/13.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDDemoBottomModuleView.h"

@implementation MDDemoBottomModuleView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor yellowColor];
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
