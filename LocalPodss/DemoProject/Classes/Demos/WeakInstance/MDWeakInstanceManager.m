//
//  MDWeakInstanceManager.m
//  Pods
//
//  Created by Leon0206 on 2020/6/11.
//

#import "MDWeakInstanceManager.h"

@interface MDWeakInstanceManager ()
@property (nonatomic, weak) id delegate;

@end

@implementation MDWeakInstanceManager

static __weak MDWeakInstanceManager *weakInstance = nil;

- (void)dealloc
{
    
}

+ (void)buildInstance:(id)delegate;
{
    MDWeakInstanceManager *strongInstance = weakInstance;
    @synchronized(self) {
        if (!strongInstance) {
            strongInstance = [[[self class] alloc] init];
            weakInstance = strongInstance;
        }
    }
    strongInstance.delegate = delegate;
    if (strongInstance.delegate && [strongInstance.delegate respondsToSelector:@selector(assignInstance:)]) {
        [strongInstance.delegate assignInstance:strongInstance];
    }
}

+ (MDWeakInstanceManager *)shareInstance
{
    return weakInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}


@end
