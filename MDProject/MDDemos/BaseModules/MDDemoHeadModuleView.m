//
//  MDDemoHeadModuleView.m
//  MDProject
//
//  Created by lizitao on 2017/5/13.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDDemoHeadModuleView.h"

@implementation MDDemoHeadModuleView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor redColor];
        [self performSelector:@selector(test) withObject:self afterDelay:3.f];
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

- (void)test
{
    self.height = self.height + 30;
}

@end
