//
//  MDURLAction.m
//  MDProject
//
//  Created by lizitao on 17/3/12.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDURLAction.h"
#import "NSURL+Ext.h"
#import "NSString+Ext.h"
#import <objc/runtime.h>

@interface MDURLAction()
// setParams:forKey:
@property (strong, nonatomic) NSMutableDictionary *params;

@end

@implementation MDURLAction

+ (id)actionWithURL:(NSURL *)url
{
    return [[MDURLAction alloc] initWithURL:url];
}

+ (id)actionWithURLString:(NSString *)urlString
{
    return [[self alloc] initWithURLString:urlString];
}

- (id)initWithURL:(NSURL *)url
{
    if (self = [super init])
    {
        _url = url;
        
        NSDictionary *dic = [url parseQuery];
        _params = [NSMutableDictionary dictionary];
        
        for (NSString *key in [dic allKeys])
        {
            id value = [dic objectForKey:key];
            [_params setObject:value forKey:[key lowercaseString]];
        }
    }
    return self;
}

- (id)initWithURLString:(NSString *)urlString
{
    return [self initWithURL:[NSURL URLWithString:urlString]];
}

- (void)setInteger:(NSInteger)intValue forKey:(NSString *)key
{
    [_params setObject:[NSNumber numberWithInteger:intValue] forKey:[key lowercaseString]];
}

- (void)setDouble:(double)doubleValue forKey:(NSString *)key
{
    [_params setObject:[NSNumber numberWithDouble:doubleValue] forKey:[key lowercaseString]];
}

- (void)setString:(NSString *)string forKey:(NSString *)key
{
    if (string.length > 0)
    {
        [_params setObject:string forKey:[key lowercaseString]];
    }
}

- (void)setObject:(NVObject *)object forKey:(NSString *)key
{
    if(object)
    {
        [_params setObject:object forKey:[key lowercaseString]];
    }
}

- (void)setAnyObject:(id)object forKey:(NSString *)key
{
    if(object)
    {
        [_params setObject:object forKey:[key lowercaseString]];
    }
}


- (NSInteger)integerForKey:(NSString *)key
{
    NSString *urlStr = [_params objectForKey:[key lowercaseString]];
    
    if(urlStr)
    {
        if ([urlStr isKindOfClass:[NSString class]])
        {
            return [urlStr integerValue];
            
        } else if ([urlStr isKindOfClass:[NSNumber class]])
        {
            return [(NSNumber *)urlStr integerValue];
        }
    }
    return 0;
}

- (double)doubleForKey:(NSString *)key
{
    NSString *urlStr = [_params objectForKey:[key lowercaseString]];
    
    if(urlStr)
    {
        if ([urlStr isKindOfClass:[NSString class]])
        {
            return [urlStr doubleValue];
        }
        else if ([urlStr isKindOfClass:[NSNumber class]])
        {
            return [(NSNumber *)urlStr doubleValue];
        }
    }
    return .0;
}

- (NSString *)stringForKey:(NSString *)key
{
    NSString *urlStr = [_params objectForKey:[key lowercaseString]];
    
    if(urlStr)
    {
        if ([urlStr isKindOfClass:[NSString class]])
        {
            return urlStr;
        }
    }
    return nil;
}

- (NVObject *)objectForKey:(NSString *)key
{
    NSString *urlStr = [_params objectForKey:[key lowercaseString]];
    if(urlStr)
    {
        if ([urlStr isKindOfClass:[NSString class]])
        {
            NSData *data = [urlStr decodeUrlBase64String];
            return data ? [NVObject objectWithData:data] : nil;
        }
        else if ([urlStr isKindOfClass:[NVObject class]])
        {
            return (NVObject *)urlStr;
        }
    }
    return nil;
}

- (id)anyObjectForKey:(NSString *)key
{
    return [_params objectForKey:[key lowercaseString]];
}

@end


@implementation UIViewController (urlAction)

- (void)setUrlAction:(MDURLAction *)urlAction
{
    objc_setAssociatedObject(self, @"UIViewControllerNVURLAction", urlAction, OBJC_ASSOCIATION_RETAIN);
}

- (MDURLAction *)urlAction
{
    return objc_getAssociatedObject(self, @"UIViewControllerNVURLAction");
}

@end
