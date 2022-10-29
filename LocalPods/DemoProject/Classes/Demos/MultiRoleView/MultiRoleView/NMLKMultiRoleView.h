//
//  NMLKMultiRoleView.h
//
//  Created by Leon0206 on 2020/2/19.
//  Copyright © 2020 Tao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMLKMultiRoleConfigModels.h"
#import <EasyLayout/EasyLayout.h>

NS_ASSUME_NONNULL_BEGIN


typedef void(^NMLKMultiRoleViewConfigBlock)(NMLKMultiRoleViewConfig *roleConfig);

@interface NMLKMultiRoleView : UIView

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

- (instancetype)initWithMultiRoleConfig:(NMLKMultiRoleViewConfigBlock)configBlock;

- (void)reloadItemsData:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
