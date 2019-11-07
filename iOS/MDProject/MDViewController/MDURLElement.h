//
//  MDURLElement.h
//  MDProject
//
//  Created by lizitao on 17/3/28.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDURLElement : NSObject

@property (nonatomic, strong, readonly) NSString *key;
@property (nonatomic, strong, readonly) NSString *classString;
@property (nonatomic, readonly) Class targetClass;

+ (MDURLElement *)patternWithClassName:(NSString *)className withKey:(NSString *)key;

@end
