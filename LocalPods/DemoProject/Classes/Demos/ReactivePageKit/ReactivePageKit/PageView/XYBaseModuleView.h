//
//  XYBaseModuleView.h
//  XYReactivePageKit
//
//  Created by Leon0206 on 2018/2/1.
//

#import <UIKit/UIKit.h>
#import <EasyLayout/EasyLayout.h>
@class RACSubject;
@interface XYBaseModuleView : UIView
@property (nonatomic, strong) RACSubject *heightSignal;
@property (nonatomic, assign) NSUInteger moduleIndex;
@end
