//
//  NMLKMultiRoleItemView.m
//
//  Created by Leon0206 on 2020/2/19.
//  Copyright © 2020 Tao. All rights reserved.
//

#import "NMLKMultiRoleItemView.h"

@implementation NMLKMultiRoleItemView

- (instancetype)initWithMultiRoleItemViewConfig:(NMLKMultiRoleItemViewConfig *)config
{
    self = [super init];
    if (self) {
        _itemConfig = config;
        [self initBgButtonWith:config.bgBtnConfig];
        if (NMLKMultiRoleItemLabelType == config.itemType) {
            [self initTitleLabelWith:config.titleLabelConfig];
        } else if (NMLKMultiRoleItemImageType == config.itemType) {
            [self initImageViewWith:config.imageViewConfig];
        } else {
            [self initTitleLabelWith:config.titleLabelConfig];
            [self initImageViewWith:config.imageViewConfig];
        }
        if (_itemConfig.clickBlock) {
            [self initCoverButton];
        }
        self.frame = CGRectMake(0, 0, config.itemSize.width, config.itemSize.height);
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)initBgButtonWith:(NMLKMultiRoleBgButtonConfig *)config
{
    _bgButton = [UIButton buttonWithType:UIButtonTypeCustom];
    if (config.cornerRadius > 0) {
        _bgButton.layer.cornerRadius = config.cornerRadius;
    }
    _bgButton.clipsToBounds = config.clipsToBounds;
    if (config.backgroundColor) {
        _bgButton.backgroundColor = config.backgroundColor;
    }
    [self addSubview:_bgButton];
}

- (void)initTitleLabelWith:(NMLKMultiRoleTitleLabelConfig *)config
{
    _titleLabel = [UILabel new];
    _titleLabel.text = config.text;
    _titleLabel.font = config.font;
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    if (config.font) {
        _titleLabel.font = config.font;
    }
    if (config.textColor) {
        _titleLabel.textColor = config.textColor;
    }
    if (config.backgroundColor) {
        _titleLabel.backgroundColor = config.backgroundColor;
    }
    if (config.shadowColor) {
        _titleLabel.shadowColor = config.shadowColor;
    }
    [self addSubview:_titleLabel];
}

- (void)initImageViewWith:(NMLKMultiRoleImageViewConfig *)config
{
    _imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    [self addSubview:_imageView];
}

- (void)initCoverButton
{
    _coverButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _coverButton.backgroundColor = [UIColor clearColor];
    [_coverButton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_coverButton];
}

- (void)clickAction:(id)sender
{
    if ([sender isKindOfClass:[UIButton class]]) {
        if (self.itemConfig.clickBlock) {
            self.itemConfig.clickBlock(self.key);
        }
    }
}

- (void)reloadValues:(NSArray *)value
{
    if (value.count == 1) {
        id obj = value.firstObject;
        if (NMLKMultiRoleItemLabelType == self.itemConfig.itemType && [obj isKindOfClass:[NSString class]]) {
            NSString *title = (NSString *)obj;
            self.titleLabel.text = title;
        }
        if (NMLKMultiRoleItemImageType == self.itemConfig.itemType) {
            if ([obj isKindOfClass:[UIImage class]]) {
                UIImage *image = (UIImage *)obj;
                if (image) {
                    self.imageView.image = image;
                }
            }
            if ([obj isKindOfClass:[NSString class]]) {
               NSString *url = (NSString *)obj;
               [self reloadImageWithUrl:url];
            }
        }
    }
    if (value.count == 2 && NMLKMultiRoleItemMixType == self.itemConfig.itemType) {
        id firstObj = value.firstObject;
        if ([firstObj isKindOfClass:[NSString class]]) {
            NSString *title = (NSString *)firstObj;
            self.titleLabel.text = title;
            [self.titleLabel sizeToFit];
            
            id secondObj = value[1];
            if ([secondObj isKindOfClass:[UIImage class]]) {
                UIImage *image = (UIImage *)secondObj;
                if (image) {
                    self.imageView.image = image;
                    [self.imageView sizeToFit];
                }
            }
        }
        if ([firstObj isKindOfClass:[UIImage class]]) {
            UIImage *image = (UIImage *)firstObj;
            if (image) {
                self.imageView.image = image;
            }
            id secondObj = value[1];
            if ([secondObj isKindOfClass:[NSString class]]) {
                NSString *title = (NSString *)secondObj;
                self.titleLabel.text = title;
                [self.titleLabel sizeToFit];
            }
        }
    }
}

- (void)reloadImageWithUrl:(NSString *)url
{
//    @weakify(self);
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        @strongify(self);
//        self.imageView.image = [UIImage imageWithData:(NSData *)responseObject];
//        [self.imageView sizeToFit];
//        if (self.delegate && [self.delegate respondsToSelector:@selector(imageLoadCompletedWith:imageSize:)]) {
////            [self.delegate imageLoadCompletedWith:self.index imageSize:self.imageView.size];
//        }
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.bgButton.size = self.size;
    self.bgButton.centerX = self.width / 2.0;
    self.bgButton.centerY = self.height / 2.0;
    
    if (NMLKMultiRoleItemLabelType == self.itemConfig.itemType) {
        self.titleLabel.size = self.size;
        self.titleLabel.centerX = self.width / 2.0;
        self.titleLabel.centerY = self.height / 2.0;
        
    } else if (NMLKMultiRoleItemImageType == self.itemConfig.itemType) {
        self.imageView.size = self.size;
        self.imageView.centerX = self.width / 2.0;
        self.imageView.centerY = self.height / 2.0;
    }
    else {
        [self layoutLabelWith:self.itemConfig.titleLabelConfig];
        [self layoutImageWith:self.itemConfig.imageViewConfig];
    }
    if (_itemConfig.clickBlock) {
        self.coverButton.size = self.bgButton.size;
        self.coverButton.centerX = self.width / 2.0;
        self.coverButton.centerY = self.height / 2.0;
    }
    
}

- (void)layoutLabelWith:(NMLKMultiRoleTitleLabelConfig *)titleLabelConfig
{
    [self.titleLabel sizeToFit];
    if (self.itemConfig.titleLabelConfig.isFixedSize) {
        self.titleLabel.size = self.itemConfig.titleLabelConfig.fixedSize;
    }
    CGFloat maxWidth = self.itemConfig.titleLabelConfig.maxWidth;
    if (maxWidth > 0) {
        if (self.titleLabel.width > maxWidth) {
            self.titleLabel.width = maxWidth;
        }
    }
    CGFloat fixedHeight = self.itemConfig.titleLabelConfig.fixedHeight;
    if (fixedHeight > 0) {
        self.titleLabel.height = fixedHeight;
    }
    CGFloat fixedWidth = self.itemConfig.titleLabelConfig.fixedWidth;
    if (fixedWidth > 0) {
        self.titleLabel.width = fixedWidth;
    }
    self.titleLabel.centerX = self.width / 2.0;
    self.titleLabel.centerY = self.height / 2.0;
    CGPoint origin = self.itemConfig.titleLabelConfig.origin;
    if (origin.x > 0 || origin.y > 0) {
        self.titleLabel.left = origin.x;
        self.titleLabel.top = origin.y;
    } else {
        if (self.itemConfig.titleLabelConfig.left > 0) {
            self.titleLabel.left = self.itemConfig.titleLabelConfig.left;
        }
        if (self.itemConfig.titleLabelConfig.top > 0) {
            self.titleLabel.top = self.itemConfig.titleLabelConfig.top;
        }
    }
}

- (void)layoutImageWith:(NMLKMultiRoleImageViewConfig *)imageViewConfig
{
    [self.imageView sizeToFit];
    if (self.itemConfig.imageViewConfig.isFixedSize) {
        self.imageView.size = self.itemConfig.imageViewConfig.fixedSize;
    }
    self.imageView.centerX = self.width / 2.0;
    self.imageView.centerY = self.height / 2.0;
    CGPoint origin = self.itemConfig.imageViewConfig.origin;
    if (origin.x > 0 || origin.y > 0) {
        self.imageView.left = origin.x;
        self.imageView.top = origin.y;
    } else {
        if (self.itemConfig.imageViewConfig.left > 0) {
            self.imageView.left = self.itemConfig.imageViewConfig.left;
        }
        if (self.itemConfig.imageViewConfig.top > 0) {
            self.imageView.top = self.itemConfig.imageViewConfig.top;
        }
    }
}

- (BOOL)checkIsZeroSize:(CGSize)size
{
    if (size.width == 0 || size.height == 0) {
        return YES;
    }
    return NO;
}

@end
