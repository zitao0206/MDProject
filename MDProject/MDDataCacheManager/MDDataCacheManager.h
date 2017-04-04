//
//  MDDataCacheManager.h
//  MDProject
//
//  Created by lizitao on 17/3/12.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import <Foundation/Foundation.h>
#define MDDCMInstance    [MDDataCacheManager instance]
/**各模块需要保存数据的KEY，采取“Name+标识”的方式**/
#define MAIN_CACHE           @"Main_Cache_101010"
#define LOCAL_NOTICE_CACHE   @"Local_Notice_Cache_101010"
#define LOCAL_EVENT_CACHE    @"Local_Event_Cache_101010"
#define LOCAL_REPORT_CACHE   @"Local_Report_Cache_101010"
#define LOCAL_NEWS_CACHE     @"Local_News_Cache_101010"


@interface MDDataCacheManager : NSObject

+ (MDDataCacheManager *) instance;

- (void)setCacheData:(id)cacheData ForKey:(NSString *)cacheKey;

- (id)getCacheData:(NSString *)cacheKey;

- (void)deleteCacheData:(NSString *)cacheKey;

- (void)clearCacheData;

@end
