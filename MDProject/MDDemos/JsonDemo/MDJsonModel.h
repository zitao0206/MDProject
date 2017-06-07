//
//  MDJsonModel.h
//  MDProject
//
//  Created by lizitao on 2017/6/7.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>

@interface MDJsonModel : MTLModel<MTLJSONSerializing>

@property(nonatomic, copy) NSString * name;
@property(nonatomic, strong) NSNumber * age;
@property(nonatomic, copy) NSString * sex;
@property(nonatomic, copy) NSString * ID;

@end
