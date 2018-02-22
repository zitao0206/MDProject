//
//  Header.h
//  MDProject
//
//  Created by lizitao on 2018/2/21.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Invoker <NSObject>

@required
- (void)preInvoke:(NSInvocation *)inv withTargrt:(id)target;

@optional
- (void)postInvoke:(NSInvocation *)inv withTargrt:(id)target;

@end

