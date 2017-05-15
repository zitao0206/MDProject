//
//  MDBaseModuleView.m
//  MDProject
//
//  Created by lizitao on 2017/5/13.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDBaseModuleView.h"
#import "MDBaseModuleModel.h"

@interface MDBaseModuleView() <MDBaseViewDelegate>
@property (nonatomic, assign) NSUInteger index;

@end

@implementation MDBaseModuleView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)initViewIndexWith:(NSUInteger)index
{
    self.index = index;
}

- (void)reloadModelData:(id)model
{
    
}

- (void)relayoutSubviews:(CGFloat)viewWidth
{
    
}

- (RACSignal *)signalOfSize
{
    __block RACSignal* textSignal;
     [[RACObserve(self, height) distinctUntilChanged] subscribeNext:^(id x) {
         textSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
             [subscriber sendNext:@(self.index)];
             [subscriber sendCompleted];
             return nil;
         }];

     }];
    
    return [RACObserve(self, height) distinctUntilChanged];
}
@end
