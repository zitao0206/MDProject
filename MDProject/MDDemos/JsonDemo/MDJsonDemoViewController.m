//
//  MDJsonDemoViewController.m
//  MDProject
//
//  Created by lizitao on 2017/6/7.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDJsonDemoViewController.h"
#import "MDJsonModel.h"

@interface MDJsonDemoViewController ()

@end

@implementation MDJsonDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *jsonstring = @"{\"name\":\"Mitchell\",\"age\":10,\"sex\":\"man\",\"ID\":\"aaa\"}";
//    NSDictionary *dict = @{@"name":@"Mitchell",@"age":@10,@"sex":@"man",@"ID":@"aaa"};
    NSDictionary *dic = [self JSONValue:jsonstring];
    MDJsonModel *model = [MTLJSONAdapter modelOfClass:[MDJsonModel class] fromJSONDictionary:dic error:nil];
    
}

- (NSString *)JSONRepresentation
{
    if (![NSJSONSerialization isValidJSONObject:self]) return @"{}";
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONReadingAllowFragments | NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"%@", error);
    }
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (id)JSONValue:(NSString *)s
{
    if (s.length == 0) return @{};
    NSError *error = nil;
    id obj = [NSJSONSerialization JSONObjectWithData:[s dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&error];
    if (error)
    {
        NSLog(@"%@", error);
        return nil;
    }
    return obj;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
}

@end
