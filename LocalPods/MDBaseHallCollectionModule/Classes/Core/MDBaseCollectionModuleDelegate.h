//
//  MDBaseHallProtocol.h
//
//  Created by Leon on 03/30/2021.
//  Copyright (c) 2021 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>
 
NS_ASSUME_NONNULL_BEGIN

@protocol MDBaseCollectionModuleDelegate <NSObject>

/***须子类重写***/
- (NSArray *)cellModules;
/***需子类重写***/
- (UIEdgeInsets)contentViewEdgeInsets;
/***需子类重写***/
- (CGFloat)minimumInteritemSpacing;
/***需子类重写***/
- (CGFloat)minimumLineSpacing;

@end

NS_ASSUME_NONNULL_END
