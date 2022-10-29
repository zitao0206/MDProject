//
//  MDWeakInstanceManager.h
//  Pods
//
//  Created by Leon0206 on 2020/3/30.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

 
@class MDWeakInstanceManager;

@protocol MDWeakInstanceManagerDelegate <NSObject>

- (void)assignInstance:(MDWeakInstanceManager *)instance;

@end

@interface MDWeakInstanceManager : NSObject

+ (void)buildInstance:(id)delegate;

//访问时须用此方法
+ (MDWeakInstanceManager *)shareInstance;

- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
