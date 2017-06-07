//
//  MDDemoTopView.m
//  MDProject
//
//  Created by lizitao on 2017/5/29.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDDemoTopView.h"

@interface MDDemoTopView ()
@property (nonatomic, strong) UILabel *label;

@end
@implementation MDDemoTopView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _label = [UILabel new];
        [self addSubview:_label];
        _label.text = @"skskk";
        [_label sizeToFit];
        [self performSelector:@selector(test1) withObject:nil afterDelay:5];
        
    }
    return self;
}

- (void)test1
{
    //    self.label.frame = CGRectMake(0, 0, 100, 100);
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

@end
