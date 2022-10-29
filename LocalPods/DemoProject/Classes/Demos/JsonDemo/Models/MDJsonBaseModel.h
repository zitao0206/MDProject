//
//  MDJsonBaseModel.h
//  MDProject
//
//  Created by Leon0206 on 2017/6/14.
//  Copyright © 2017年 Leon0206. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDJsonBaseModel : NSObject

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionaryValue;

- (void)setModelWithDictionary:(NSDictionary *)dictionaryValue;

@end
