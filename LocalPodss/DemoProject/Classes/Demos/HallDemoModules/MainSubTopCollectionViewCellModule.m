//
//  MainSubTopCollectionViewCellModule.m
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import "MainSubTopCollectionViewCellModule.h"
#import <EasyLayout/EasyLayout.h>
#import "MDDemoHallCollectionVModels.h"

@interface MainSubTopCollectionViewCellModule()
@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation MainSubTopCollectionViewCellModule

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        self.contentView.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.5];
     
    }
    return self;
}

- (void)loadCellModuleData:(MainTopModel *)model
{
    if ([model isKindOfClass:[MainTopModel class]]) {
        self.titleLabel.text = [NSString stringWithFormat:@"Top模块化框架进阶%@",model.title];
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
