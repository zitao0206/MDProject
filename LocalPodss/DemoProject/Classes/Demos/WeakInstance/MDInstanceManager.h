//
//  MDInstanceManager.h
//  Pods
//
//  Created by Leon0206 on 2020/3/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MDInstanceManager : NSObject

//访问时须用此方法
+ (MDInstanceManager *)shareInstance;

- (instancetype)init __attribute__((unavailable("replace with 'sharedInstance'")));
+ (instancetype)alloc __attribute__((unavailable("replace with 'sharedInstance'")));
+ (instancetype)new __attribute__((unavailable("replace with 'sharedInstance'")));
- (instancetype)copy __attribute__((unavailable("replace with 'sharedInstance'")));
- (instancetype)mutableCopy __attribute__((unavailable("replace with 'sharedInstance'")));

- (void)destroy;

@end

NS_ASSUME_NONNULL_END
