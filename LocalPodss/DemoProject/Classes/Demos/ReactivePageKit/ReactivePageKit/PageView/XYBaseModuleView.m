//
//  XYBaseModuleView.m
//  XYReactivePageKit
//
//  Created by Leon0206 on 2018/2/1.
//

#import "XYBaseModuleView.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "XYBaseModuleViewDelegate.h"
#import <EasyLayout/EasyLayout.h>

@interface XYBaseModuleView ()<XYBaseModuleViewDelegate>

@end

@implementation XYBaseModuleView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        _heightSignal = [RACSubject subject];
    }
    return self;
}

- (void)setModuleIndex:(NSUInteger)moduleIndex
{
    _moduleIndex = moduleIndex;
    [[[[RACObserve(self, height) distinctUntilChanged] skip:1] deliverOnMainThread] subscribeNext:^(id x) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.heightSignal sendNext:[NSNumber numberWithInteger:moduleIndex]];
        });
    }];
}

/***须子类重写***/
- (void)loadModuleViewData:(id)model
{
}

/***须子类重写***/
- (void)layoutModuleViewWithWidth:(CGFloat)width
{ 
}

@end
