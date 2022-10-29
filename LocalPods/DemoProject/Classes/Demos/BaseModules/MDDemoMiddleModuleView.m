//
//  MDDemoMiddleModuleView.m
//  MDProject
//
//  Created by Leon0206 on 2017/5/13.
//  Copyright © 2017年 Leon0206. All rights reserved.
//

#import "MDDemoMiddleModuleView.h"

@implementation MDDemoMiddleModuleView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor lightGrayColor];
         [self performSelector:@selector(test) withObject:self afterDelay:10.f];
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

- (void)test
{
    self.height = self.height + 30;
    self.indexLabel.centerY = self.frame.size.height / 2;
}

@end
