//
//  NMLKMultiRoleConfigModels.h
//  Pods
//
//  Created by Leon0206 on 2020/4/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, NMLKMultiRoleItemType) {
    NMLKMultiRoleItemLabelType = 0,  //纯文字标签，数据源为title
    NMLKMultiRoleItemImageType = 1,  //纯图片，数据源为image
    NMLKMultiRoleItemMixType = 2,    //图片+文字，数据源为以上两者
};

typedef NS_ENUM(NSInteger, NMLKMultiRoleDirectionType) {
    NMLKMultiRoleHorizontal = 0,  //水平布局
    NMLKMultiRoleVertical = 1,   //竖直布局
};

//bgButton属性
@interface NMLKMultiRoleBaseConfig : NSObject
@property(nonatomic, assign) CGSize fixedSize;//定size
@property(nonatomic, assign) CGFloat fixedHeight; //定高，宽度自适应
@property(nonatomic, assign) CGFloat fixedWidth;//定宽，高度自适应
@property(nonatomic, assign) CGPoint origin;
@property(nonatomic, assign) CGFloat top;
@property(nonatomic, assign) CGFloat left;
@property(nonatomic, assign) BOOL isFixedSize;
@property(nonatomic, assign) CGFloat maxWidth;
@end

//bgButton属性
@interface NMLKMultiRoleBgButtonConfig : NMLKMultiRoleBaseConfig
@property(nonatomic, assign) CGFloat cornerRadius;
@property(nonatomic, assign) BOOL clipsToBounds;
@property(nonatomic, strong) UIImage *backgroundImage;
@property(nonatomic, strong) UIColor *backgroundColor;

@end

//titleLabel属性
@interface NMLKMultiRoleTitleLabelConfig : NMLKMultiRoleBaseConfig
@property(nullable, nonatomic,copy) NSString *text;
@property(nonatomic, strong) UIFont *font;
@property(nonatomic, strong) UIColor *textColor;
@property(nonatomic, strong) UIColor *backgroundColor;
@property(nullable, nonatomic,strong) UIColor *shadowColor;

@end

//imageView属性
@interface NMLKMultiRoleImageViewConfig : NMLKMultiRoleBaseConfig
@property (nullable, nonatomic, strong) UIImage *image;

@end

typedef void(^NMLKMultiRoleItemClickBlock)(NSString *key);
@interface NMLKMultiRoleItemViewConfig : NSObject
@property(nonatomic, assign) NMLKMultiRoleItemType itemType;
@property(nonatomic, assign) CGSize itemSize;
@property(nonatomic, assign) CGFloat itemSpace; //与前一个item的边距，第一个item默认为0
@property(nonatomic, strong) NMLKMultiRoleBgButtonConfig *bgBtnConfig;
@property(nonatomic, strong) NMLKMultiRoleTitleLabelConfig *titleLabelConfig;
@property(nonatomic, strong) NMLKMultiRoleImageViewConfig *imageViewConfig;
@property(nonatomic, copy) NMLKMultiRoleItemClickBlock clickBlock; //元素的点击事件
@end

@interface NMLKMultiRoleViewConfig : NSObject
@property(nonatomic, assign) NMLKMultiRoleDirectionType direction;
@property(nonatomic, assign) CGSize size;     //背景view高度
@property(nonatomic, assign) BOOL isFixedSize;  // 是否去自适应固定的size，YES，需设置外部size
@property(nonatomic, assign) UIEdgeInsets insets;
@property(nonatomic, strong) UIColor *backgroundColor;  //背景View的背景色
@property(nonatomic, assign) CGFloat space;  //每个item的间距，优先级低于itemSpace
@property(nonatomic, strong) NSDictionary <NSString *, NMLKMultiRoleItemViewConfig *> *itemsConfig;

+ (NMLKMultiRoleViewConfig *)defaultConfig;

@end

NS_ASSUME_NONNULL_END
