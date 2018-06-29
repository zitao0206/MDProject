//
//  MDFelix.h
//  MDProject
//
//  Created by lizitao on 2018/6/24.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import <Aspects.h>
#import <objc/runtime.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface MDFelix : NSObject
+ (MDFelix *)sharedInstance;
+ (void)fixIt;
+ (void)evalString:(NSString *)javascriptString;
@end
@interface MDBoxing : NSObject
@property (nonatomic) id obj;
@property (nonatomic) void *pointer;
@property (nonatomic) Class cls;
@property (nonatomic, weak) id weakObj;
@property (nonatomic, assign) id assignObj;
- (id)unbox;
- (void *)unboxPointer;
- (Class)unboxClass;
@end
