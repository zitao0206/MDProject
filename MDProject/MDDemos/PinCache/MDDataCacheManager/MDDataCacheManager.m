//
//  MDDataCacheManager.m
//  MDProject
//
//  Created by lizitao on 17/3/12.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDDataCacheManager.h"
#define DocPath(fileName) [((NSString *)NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0]) stringByAppendingPathComponent:fileName] 
#define SuffixString @"101010"
@interface MDDataCacheManager()

@property (nonatomic) dispatch_queue_t queue;

@end

@implementation MDDataCacheManager
{
    NSFileManager *fm;
    NSMutableSet *FileNameKeySet;
}

+ (MDDataCacheManager *)instance
{
    static MDDataCacheManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MDDataCacheManager alloc] init];
    });
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        //初始化字典集
        FileNameKeySet = [NSMutableSet setWithObjects:
                          MAIN_CACHE,LOCAL_NOTICE_CACHE,LOCAL_EVENT_CACHE,LOCAL_REPORT_CACHE,LOCAL_NEWS_CACHE,
                          nil];
        fm = [NSFileManager defaultManager];
        _queue = dispatch_queue_create("com.datacache.qifengle", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

/***
 方法名称：setCacheData:ForKey:
 方法用途：写入文件
 方法说明：根据文件名cacheKey进行写入，写入之前先判断是否存在，写入时采取二进制方式存储；
 方法作者：Created by ztli on 15-01-19
 ***/
- (void)setCacheData:(id)cacheData ForKey:(NSString *)cacheKey
{
    if ([FileNameKeySet containsObject:cacheKey])
    {
        BOOL success = [NSKeyedArchiver archiveRootObject:cacheData toFile:DocPath(cacheKey)];
        if (!success)
        {
            NSAssert(0, @"写入文件错误");
        }
    }
}

/***
 方法名称：getCacheData:(NSString *)cacheKey
 方法用途：读取文件
 方法说明：根据文件名cacheKey进行读取，读取之前先判断是否存在；
 方法作者：Created by ztli on 15-01-19
 ***/
- (id)getCacheData:(NSString *)cacheKey
{
    //从文件中读取到NSMutableArray
    if ([FileNameKeySet containsObject:cacheKey])
    {
        NSMutableArray *tempArray = [NSKeyedUnarchiver unarchiveObjectWithFile:DocPath(cacheKey)];
        return tempArray;
        
    } else
    {
        return nil;
    }
}

/***
 方法名称：deleteCacheData:(NSString *)cacheKey
 方法用途：删除某一个文件数据
 方法说明：根据文件名cacheKey进行删除，删除之前先判断是否存在；
 方法作者：Created by ztli on 15-01-19
 ***/
- (void)deleteCacheData:(NSString *)cacheKey
{
    if ([FileNameKeySet containsObject:cacheKey])
    {
        BOOL isExist = [fm fileExistsAtPath:DocPath(cacheKey)];
        if (isExist)
        {
            NSError *error;
            BOOL success = [fm removeItemAtPath:DocPath(cacheKey) error:&error];
            if (!success)
            {
                NSAssert(0, @"删除文件错误");
            }
        }
    }
}

/***
 方法名称：clearCacheData
 方法用途：清空缓存所有缓存文件；
 方法说明：清空时根据缓存文件的后缀来查找，后缀统一采取加数字“101010”的方式；
 方法作者：Created by ztli on 15-01-19
 ***/
- (void)clearCacheData
{
    NSString *path = DocPath(@"");
    NSArray *tempArray = [fm contentsOfDirectoryAtPath:path error:NULL];
    for(path in  tempArray)
    {
        if([path hasSuffix:SuffixString])
        {
            NSLog(@"%@",path);
            [self deleteCacheData:path];
        }
    }
}


@end
