//
//  MDCacheViewController.h
//  MDProject
//
//  Created by lizitao on 2018/6/15.
//

#import "MDCacheViewController.h"
#import "TMCache.h"
#import "PINCache.h"
#import "SDImageCache.h"
#import "MDDataCacheManager.h"

@interface MDCacheViewController ()

@end

@implementation MDCacheViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

//    [self imageCacheTest];
    [self pinCacheTest];
    
}

- (void)pinCacheTest
{
    NSString *stringValue = @"hello world..hello world..hello world..hello world..hello world..hello world..";
    
    [[PINCache sharedCache]setObject:stringValue forKey:@"string_key"];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[PINDiskCache sharedCache]objectForKey:@"string_key" block:^(PINDiskCache * _Nonnull cache, NSString * _Nonnull key, id<NSCoding>  _Nullable object, NSURL * _Nonnull fileURL) {
            NSLog(@"0------>%@",object);

        }];
        NSLog(@"1------>%@",[[PINCache sharedCache] objectForKey:@"string_key"]);
        NSLog(@"2------>%@",[[PINCache sharedCache].memoryCache objectForKey:@"string_key"]);
        NSLog(@"3------>%@",[[PINCache sharedCache].diskCache objectForKey:@"string_key"]);

    });
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//
//        [[PINCache sharedCache]objectForKey:@"image_key" block:^(PINCache * _Nonnull cache, NSString * _Nonnull key, id  _Nullable object) {
//             NSLog(@"0------>%@",object);
//
//        }];
//
//        NSLog(@"1------>%@",[[PINCache sharedCache].memoryCache objectForKey:@"image_key"]);
//        NSLog(@"2------>%@",[[PINCache sharedCache].diskCache objectForKey:@"image_key"]);
//
////        NSLog(@"3------>%@",[[PINDiskCache sharedCache] objectForKey:@"image_key"]);
////        NSLog(@"4------>%@",[[PINMemoryCache sharedCache] objectForKey:@"image_key"]);
//    });
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [[PINCache sharedCache] objectForKey:@""];
        
//        NSLog(@"1------>%@",[[TMCache sharedCache].memoryCache objectForKey:@"image_key"]);
//        NSLog(@"2------>%@",[[TMCache sharedCache].diskCache objectForKey:@"image_key"]);

        
        //        NSLog(@"3------>%@",[[PINDiskCache sharedCache] objectForKey:@"image_key"]);
        //        NSLog(@"4------>%@",[[PINMemoryCache sharedCache] objectForKey:@"image_key"]);
//    });
}

- (void)imageCacheTest
{
//    UIImage *image = [UIImage imageNamed:@"launch.jpg"];
//    [[PINCache sharedCache]setObject:image forKey:@"image_key"];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [[PINCache sharedCache]objectForKey:@"image_key" block:^(PINCache * _Nonnull cache, NSString * _Nonnull key, id  _Nullable object) {
//            NSLog(@"------>%@",object);
//
//        }];
//    });
    
    UIImage *image = [UIImage imageNamed:@"launch.jpg"];
    [[SDImageCache sharedImageCache] storeImage:image forKey:@"image_key" toDisk:YES completion:^{
        
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        UIImage *image1 = [[SDImageCache sharedImageCache] imageFromCacheForKey:@"image_key"];
        NSLog(@"1------>%@",image1);
        UIImage *image2 = [[SDImageCache sharedImageCache] imageFromMemoryCacheForKey:@"image_key"];
        NSLog(@"2------>%@",image2);
        UIImage *image3 = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:@"image_key"];
        NSLog(@"3------>%@",image3);
        
        
    });
}

@end
