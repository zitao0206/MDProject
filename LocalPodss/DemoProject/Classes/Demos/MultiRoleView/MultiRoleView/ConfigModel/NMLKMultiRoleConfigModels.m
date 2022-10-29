//
//  NMLKMultiRoleConfigModels.m
//  Pods
//
//  Created by Leon0206 on 2020/4/24.
//

#import "NMLKMultiRoleConfigModels.h"
#define NMLKWidth [UIScreen mainScreen].bounds.size.width

@implementation NMLKMultiRoleBaseConfig

- (instancetype)init
{
    if(self = [super init]) {
        _origin = CGPointMake(-1.0, -1.0);
        _fixedWidth = -1;
        _fixedHeight = -1;
        _left = -1.0;
        _top = -1.0;
        _maxWidth = -1.0;
    }
    return self;
}

@end

@implementation NMLKMultiRoleBgButtonConfig

@end

@implementation NMLKMultiRoleTitleLabelConfig

@end

@implementation NMLKMultiRoleImageViewConfig

@end

@implementation NMLKMultiRoleItemViewConfig

- (instancetype)init
{
    if(self = [super init]) {
        _bgBtnConfig = [NMLKMultiRoleBgButtonConfig new];
        _titleLabelConfig = [NMLKMultiRoleTitleLabelConfig new];
        _imageViewConfig = [NMLKMultiRoleImageViewConfig new];
    }
    return self;
}

@end

@implementation NMLKMultiRoleViewConfig

+ (NMLKMultiRoleViewConfig *)defaultConfig
{
    NMLKMultiRoleViewConfig *config = [NMLKMultiRoleViewConfig new];
    config.size = CGSizeMake(NMLKWidth, 30);
    return config;
}

@end
