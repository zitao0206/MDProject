//
//  MDInvokerViewController.m
//  MDProject
//
//  Created by lizitao on 2018/2/21.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDInvokerViewController.h"
#import "Calculator.h"
#import "AspectProxy.h"
#import "AuditingInvoker.h"

@interface MDInvokerViewController ()

@end

@implementation MDInvokerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    id cal = [Calculator new];
    NSNumber *add1 = [NSNumber numberWithInteger:2];
    NSNumber *add2 = [NSNumber numberWithInteger:4];
    NSNumber *add3 = [NSNumber numberWithInteger:1];
    NSValue *selValue1 = [NSValue valueWithPointer:@selector(sumAdd1:add2:)];
    NSArray *selValues = @[selValue1];
    AuditingInvoker *invoke = [AuditingInvoker new];
    id calculatorProxy = [[AspectProxy alloc] initWithObject:cal selectors:selValues andInvoker:invoke];
    NSNumber *result1 = [calculatorProxy sumAdd1:add1 add2:add2];
    NSLog(@"result1----->%@",result1);
    
    NSNumber *result2 = [calculatorProxy sumAdd1:add1 :add3];
    NSLog(@"result2----->%@",result2);
    
    [calculatorProxy registerSelector:@selector(sumAdd1::)];
    NSNumber *result3 = [calculatorProxy sumAdd1:add1 :add3];
    NSLog(@"result3----->%@",result3);
    
}

@end
