//
//  MDBaseModuleView.m
//  MDProject
//
//  Created by lizitao on 2017/5/13.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDBaseModuleView.h"

@interface MDBaseModuleView() <MDBaseViewDelegate>

@end

@implementation MDBaseModuleView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)reloadModelData:(id)model
{
    
}

- (void)relayoutSubviews:(CGFloat)viewWidth
{
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
