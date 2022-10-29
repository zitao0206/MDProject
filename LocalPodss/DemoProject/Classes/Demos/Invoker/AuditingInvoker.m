//
//  AuditingInvoker.m
//  MDProject
//
//  Created by Leon0206 on 2018/2/21.
//  Copyright © 2018年 Leon0206. All rights reserved.
//

#import "AuditingInvoker.h"

@implementation AuditingInvoker
- (void)preInvoke:(NSInvocation *)inv withTargrt:(id)target
{
    NSLog(@"Creating audit log before sending message with selector %@ to %@ object",NSStringFromSelector([inv selector]), [target classNameForClass:[target class]]);
}

- (void)postInvoke:(NSInvocation *)inv withTargrt:(id)target
{
    NSLog(@"Creating audit log after sending message with selector %@ to %@ object",NSStringFromSelector([inv selector]), [target classNameForClass:[target class]]);
}

@end
