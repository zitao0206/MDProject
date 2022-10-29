//
//  MainSubMiddleCollectionViewCellModule.m
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import "MainSubMiddleCollectionViewCellModule.h"
#import "MDDemoHallCollectionVModels.h"

@interface MainSubMiddleCollectionViewCellModule()
@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation MainSubMiddleCollectionViewCellModule

- (void)dealloc
{
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        self.contentView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.5];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            self.size = CGSizeMake(self.width, 100);
//            self.frame = CGRectMake(0, 0, self.width, 100);
        });
    }
    return self;
}

- (void)loadCellModuleData:(MainMiddleModel *)model
{
    if ([model isKindOfClass:[MainMiddleModel class]]) {
        self.titleLabel.text = [NSString stringWithFormat:@"Middle模块化框架进阶%@",model.number];
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
