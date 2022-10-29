//
//  MDInstanceManager.m
//  Pods
//
//  Created by Leon0206 on 2020/6/11.
//

#import "MDInstanceManager.h"

@implementation MDInstanceManager

static MDInstanceManager *shareInstance = nil;

static dispatch_once_t onceToken;

+ (instancetype)shareInstance
{
    dispatch_once(&onceToken, ^{
        if(!shareInstance) {
            shareInstance = [[self alloc] init];
        }
    });
    return shareInstance;
}

/**覆盖该方法主要确保当用户通过[[Singleton alloc] init]创建对象时对象的唯一性，alloc方法会调用该方法，只不过zone参数默认为nil，因该类覆盖了allocWithZone方法，所以只能通过其父类分配内存，即[super allocWithZone:zone]
 */

+ (id)allocWithZone:(NSZone *)zone
{
    if(!shareInstance) {
        shareInstance = [super allocWithZone:zone];
    }
    return shareInstance;
}

- (id)copy
{
    return shareInstance;
}

- (id)mutableCopy
{
    return shareInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)destroy
{
    shareInstance = nil;
    onceToken = 0;
}

@end
