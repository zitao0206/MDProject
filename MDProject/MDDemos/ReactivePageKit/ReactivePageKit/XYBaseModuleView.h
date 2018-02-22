//
//  XYBaseModuleView.h
//  XYReactivePageKit
//
//  Created by lizitao on 2018/2/1.
//

#import <UIKit/UIKit.h>
#import "UIView+ResizeFrame.h"
@class RACSubject;
@interface XYBaseModuleView : UIView
@property (nonatomic, strong) RACSubject *heightSignal;
@property (nonatomic, assign) NSUInteger moduleIndex;
@end
