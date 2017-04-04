//
//  NSURL+Ext.h
//  Core
//
//  Created by ZhouHui on 14-4-22.
//  Copyright (c) 2014年 dianping.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Ext)

/**
 将query解析为NSDictionary
 
 @return 返回参数字典对象，参数的值已经进行了decode.
 (stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding)
 */
- (NSDictionary *)parseQuery;

@end
