//
//  MDDemoBottomModuleView.m
//  MDProject
//
//  Created by Leon0206 on 2017/5/13.
//  Copyright © 2017年 Leon0206. All rights reserved.
//

#import "MDDemoBottomModuleView.h"

@implementation MDDemoBottomModuleView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)loadViewWithData:(id)model
{
    self.indexLabel.text = [[NSString alloc]initWithFormat:@"Module %@",@(self.moduleIndex)];
    
}

- (void)layoutViewWithWidth:(CGFloat)viewWidth
{
    self.frame = CGRectMake(0, 0, viewWidth, 100.0);
    [self.indexLabel sizeToFit];
    self.indexLabel.centerX = self.frame.size.width / 2;
    self.indexLabel.centerY = self.frame.size.height / 2;
    
}

@end
