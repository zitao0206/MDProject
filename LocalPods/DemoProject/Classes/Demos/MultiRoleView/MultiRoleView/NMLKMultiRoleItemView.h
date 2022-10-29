//
//  NMLKMultiRoleItemView.h
//
//  Created by Leon0206 on 2020/2/19.
//  Copyright © 2020 Tao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMLKMultiRoleConfigModels.h"
#import <EasyLayout/EasyLayout.h>

NS_ASSUME_NONNULL_BEGIN
@protocol NMLKMultiRoleItemViewDelegate <NSObject>

- (void)imageLoadCompletedWith:(NSInteger)index imageSize:(CGSize)image;

@end

@interface NMLKMultiRoleItemView : UIView
@property (nonatomic, copy) NSString *key;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) UIButton *coverButton;
@property (nonatomic, strong) UIButton *bgButton; //最底层，负责背景展示
@property (nonatomic, strong) UILabel *titleLabel; //负责文案展示
@property (nonatomic, strong) UIImageView *imageView;//负责图片展示
@property (nonatomic, strong) NMLKMultiRoleItemViewConfig *itemConfig;
@property (nonatomic, weak) id<NMLKMultiRoleItemViewDelegate> delegate;

- (instancetype)initWithMultiRoleItemViewConfig:(NMLKMultiRoleItemViewConfig *)config;

- (void)reloadValues:(NSArray *)value;

@end

NS_ASSUME_NONNULL_END
