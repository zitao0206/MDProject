//
//  MDBaseModuleModel.h
//  MDProject
//
//  Created by lizitao on 2017/5/13.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDBaseModuleModel : NSObject
@property (nonatomic, strong) NSString *title;
@end

@interface MDBaseLayoutModel : NSObject
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) NSUInteger index;

@end
