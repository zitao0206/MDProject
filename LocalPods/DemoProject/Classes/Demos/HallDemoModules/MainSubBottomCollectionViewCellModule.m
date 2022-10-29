//
//  MainSubBottomCollectionViewCellModule.m
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import "MainSubBottomCollectionViewCellModule.h"

@interface MainSubBottomCollectionViewCellModule()
@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation MainSubBottomCollectionViewCellModule

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        self.contentView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    }
    return self;
}

- (void)loadCellModuleData:(NSString *)title
{
    if ([title isKindOfClass:[NSString class]]) {
        self.titleLabel.text = [NSString stringWithFormat:@"Bottom模块化框架进阶%@",title];
        [self.titleLabel sizeToFit];
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.center = self.contentView.center;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [[UIColor blackColor]colorWithAlphaComponent:1.0];
    }
    return _titleLabel;
}

@end
