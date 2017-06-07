//
//  MDJsonLabelModel.h
//  MDProject
//
//  Created by lizitao on 2017/6/7.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>

@interface MDJsonLabelContentModel : MTLModel<MTLJSONSerializing>
/** 字体颜色*/
@property (nonatomic, copy) NSString *textColor;
/** 字体大小*/
@property (nonatomic, strong) NSNumber *textSize; // double
/** 文字*/
@property (nonatomic, copy) NSString *text;

@end

@interface MDJsonLabelModel : MTLModel<MTLJSONSerializing>
/** 背景颜色*/
@property (nonatomic, copy) NSString *backgroundColor;
/** 行间距*/
@property (nonatomic, strong) NSNumber *lineSpacing; // double
/** label中的文字*/
@property (nonatomic, strong) NSArray <MDJsonLabelContentModel *> *textList;

@end
