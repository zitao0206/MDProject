//
//  MDBaseWeakInstanceManager.m
//  Pods
//
//  Created by Leon0206 on 2020/6/11.
//

#import "MDBaseWeakInstanceManager.h"

@implementation MDBaseWeakInstanceManager

static __weak MDBaseWeakInstanceManager *weakInstance = nil;

- (void)dealloc
{
    
}

+ (void)buildInstance:(id)delegate identifier:(NSString *)identifier;
{
    MDBaseWeakInstanceManager *strongInstance = weakInstance;
    @synchronized(self) {
        if (!strongInstance || ![strongInstance.identifier isEqualToString:identifier]) {
            strongInstance = [[[self class] alloc] init];
            strongInstance.identifier = identifier;
            weakInstance = strongInstance;
        }
    }
    strongInstance.delegate = delegate;
    if (strongInstance.delegate && [strongInstance.delegate respondsToSelector:@selector(buildInstance:identifier:)]) {
        [strongInstance.delegate buildInstance:strongInstance identifier:identifier];
    }
}

+ (MDBaseWeakInstanceManager *)shareInstance
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
