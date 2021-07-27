//
//  MDBaseCollectionCellModule.h
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MDBaseCollectionCellModuleLayout;
@class MDBaseCollectionCellModule;
@class ReactiveBlackBoard;

NS_ASSUME_NONNULL_BEGIN
@protocol MDBaseCollectionCellModuleDelegate <NSObject>

- (void)reLayoutCellModuleWith:(NSIndexPath *)indexPath;

@end

@protocol MDBaseCollectionCellModuleCommonDelegate <NSObject>

- (void)loadCellModuleData:(id)model;

@end


@interface MDBaseCollectionCellModule : UICollectionViewCell

@property (nonatomic, strong) ReactiveBlackBoard *blackBoard;

@property (nonatomic, assign) NSIndexPath *moduleIndexPath;

@property (nonatomic, weak) id delegate;

@property (nonatomic, strong) MDBaseCollectionCellModuleLayout *layout;
 
@end

NS_ASSUME_NONNULL_END
