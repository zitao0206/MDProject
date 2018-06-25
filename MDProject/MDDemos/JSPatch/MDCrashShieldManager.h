//
//  MDCrashShieldManager.h
//  MDProject
//
//  Created by lizitao on 2018/6/22.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDCrashShieldManager : NSObject
+ (instancetype)manager;
- (void)startPatch;

@end
