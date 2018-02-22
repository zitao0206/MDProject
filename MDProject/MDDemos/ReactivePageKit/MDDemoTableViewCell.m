//
//  MDDemoTableViewCell.m
//  MDProject
//
//  Created by lizitao on 2018/2/22.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDDemoTableViewCell.h"
#import "UIView+ResizeFrame.h"
#import "MDDemoTableViewCellModel.h"

@interface MDDemoTableViewCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *indexLabel;
@end

@implementation MDDemoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:_titleLabel];
        _indexLabel = [UILabel new];
        _indexLabel.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:_indexLabel];
         self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setModel:(MDDemoTableViewCellModel *)model
{
    if (model == nil) return;
    self.titleLabel.text = model.title;
    self.indexLabel.text = model.index;
    [self layoutSubviews];
}

- (void)layoutSubviews
{
    [self.titleLabel sizeToFit];
    self.titleLabel.top = (self.frame.size.height - self.titleLabel.height)/2;
    self.titleLabel.left = 30;
    
    [self.indexLabel sizeToFit];
    self.indexLabel.top = (self.frame.size.height - self.indexLabel.height)/2;
    self.indexLabel.left = self.titleLabel.right + 15;
}


@end
