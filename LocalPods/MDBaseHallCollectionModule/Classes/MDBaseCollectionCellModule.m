//
//  MDBaseCollectionCellModule.m
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import "MDBaseCollectionCellModule.h"
#import "MDBaseHallCollectionViewController.h"
#import "MDBaseCollectionCellModuleLayout.h"
#import <ReactiveDataBoard/ReactiveDataBoard.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface MDBaseCollectionCellModule()<MDBaseCollectionCellModuleCommonDelegate>
 
@end


@implementation MDBaseCollectionCellModule

- (void)setBlackBoard:(ReactiveBlackBoard *)blackBoard
{
    _blackBoard = blackBoard;
    @weakify(self);
    RACSignal *heightSignal = [[RACObserve(self, height) distinctUntilChanged] skip:1];
    RACSignal *widthSignal = [[RACObserve(self, width) distinctUntilChanged] skip:1];
    RACSignal *sizeSignal = [[RACObserve(self, size) distinctUntilChanged] skip:1];
    RACSignal *frameSignal = [[RACObserve(self, frame) distinctUntilChanged] skip:1];
    [[[[[heightSignal merge:widthSignal]merge:sizeSignal]merge:frameSignal] deliverOnMainThread]subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        if (self.delegate && [self.delegate respondsToSelector:@selector(reLayoutCellModuleWith:)]) {
            self.layout.width = self.width;
            self.layout.height = self.height;
            [self.delegate reLayoutCellModuleWith:self.moduleIndexPath];
        }
    }];
}

- (void)setModuleIndexPath:(NSIndexPath *)moduleIndexPath
{
    _moduleIndexPath = moduleIndexPath;
}

- (void)loadCellModuleData:(id)model
{
    
}

@end
