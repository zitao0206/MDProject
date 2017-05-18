//
//  MDBaseModuleView.m
//  MDProject
//
//  Created by lizitao on 2017/5/13.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDBaseModuleView.h"
#import "MDBaseModuleModel.h"
@class RACSubject;
@interface MDBaseModuleView() <MDBaseViewDelegate>
@property (nonatomic, assign) NSUInteger index;
@end

@implementation MDBaseModuleView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        _heightChangeSignal = [RACSubject subject];
    }
    return self;
}

- (void)configViewWithIndex:(NSUInteger)index
{
    self.index = index;
    [[[RACObserve(self, height) distinctUntilChanged] skip:1] subscribeNext:^(id x) {
        [self.heightChangeSignal sendNext:[NSNumber numberWithInteger:index]];
    }];
}

- (void)loadViewWithData:(id)data
{
    
}

- (void)layoutViewWithWidth:(CGFloat)viewWidth
{
    
}


@end
