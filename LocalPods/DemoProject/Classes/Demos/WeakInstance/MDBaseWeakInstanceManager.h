//
//  MDBaseWeakInstanceManager.h
//  Pods
//
//  Created by Leon0206 on 2020/3/30.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

 
@class MDBaseWeakInstanceManager;

@protocol MDBaseWeakInstanceManagerDelegate <NSObject>

- (void)buildInstance:(MDBaseWeakInstanceManager *)instance identifier:(NSString *)identifier;

@end

@interface MDBaseWeakInstanceManager : NSObject

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, weak) id delegate;

+ (void)buildInstance:(id)delegate identifier:(NSString *)identifier;

//访问时须用此方法
+ (MDBaseWeakInstanceManager *)shareInstance;

- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
