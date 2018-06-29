//
//  MDEasyHotFixTool.h
//  MDProject
//
//  Created by lizitao on 2018/6/25.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface MDEasyHotFixTool : NSObject
+ (MDEasyHotFixTool *)tool;
- (void)startInitContext;
- (JSValue *)evaluateScript:(NSString *)script;
@end
