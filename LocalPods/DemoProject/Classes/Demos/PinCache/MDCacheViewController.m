//
//  MDCacheViewController.h
//  MDProject
//
//  Created by Leon0206 on 2018/6/15.
//

#import "MDCacheViewController.h"
//#import "TMCache.h"
//#import "PINCache.h"
//#import "SDImageCache.h"
//#import "MDDataCacheManager.h"
//#import "MDEasyCache.h"
//#import "MDCacheTestModel.h"

@interface MDCacheViewController ()

@end

@implementation MDCacheViewController

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
//
////    [self imageCacheTest];
////    [self pinCacheTest];
////    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(easyCacheTest) userInfo:nil repeats:YES];
////    [self easyCacheTest];
//
//    [self easyCacheModelTest];
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self performSelector:@selector(jump) withObject:nil];
//    });
//
//}
//
//- (void)jump
//{
//    NSLog(@"----->jump");
//
//}
//
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
//{
//    NSString *sel = NSStringFromSelector(selector);
//    if ([sel rangeOfString:@"set"].location == 0) {
//        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
//    } else {
//        return [NSMethodSignature signatureWithObjCTypes:"@@:"];
//    }
//}
//
//- (void)forwardInvocation:(NSInvocation *)invocation
//{
//
//}
//
//- (void)easyCacheModelTest
//{
//    MDCacheTestModel *model = [MDCacheTestModel new];
//    model.age = @"30";
//    model.name = @"Leon0206";
//    model.male = @"nan";
//    model.address = @"hangzhou";
//
//    UIImage *image = [UIImage imageNamed:@"launch.jpg"];
//
//    [[MDEasyCache easyCache] setObject:image forKey:@"model_key"];
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [[MDEasyCache easyCache] objectForKey:@"model_key" completion:^(MDEasyCacheConfig *config) {
//
//            NSLog(@"------->%@",config.object);
//
//        }];
//    });
//}
//
//- (void)easyCacheTest
//{
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSString *key = [NSString stringWithFormat:@"image_key"];
//        UIImage *image = [UIImage imageNamed:@"launch.jpg"];
//        [[MDEasyCache easyCache] setObject:image forKey:key completion:nil];
//    });
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSString *key = [NSString stringWithFormat:@"string_key"];
//        NSString *stringValue = @"hello world...";
//        [[MDEasyCache easyCache] setObject:stringValue forKey:key];
//    });
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSString *key = [NSString stringWithFormat:@"value_key"];
//        UIImage *image = [UIImage imageNamed:@"desktop.png"];
//        [[MDEasyCache easyCache] setObject:image forKey:key completion:nil];
//    });
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        NSLog(@"1------->%@",[[MDEasyCache easyCache] objectForKey:@"image_key" completion:^(MDEasyCacheConfig *config) {
//            NSLog(@"---->%@",config.object);
//        }]);
//
//        NSLog(@"2------->%@",[[MDEasyCache easyCache] objectForKey:@"string_key" completion:^(MDEasyCacheConfig *config) {
//                 NSLog(@"---->%@",config.object);
//        }]);
//        NSLog(@"3------->%@",[[MDEasyCache easyCache] objectForKey:@"value_key"]);
//
//        [[MDEasyCache easyCache] clearMemory];
//        [[MDEasyCache easyCache] clearDisk];
//
//
//        NSLog(@"4------->%@",[[MDEasyCache easyCache] objectForKey:@"image_key" completion:^(MDEasyCacheConfig *config) {
//            NSLog(@"---->%@",config.object);
//        }]);
//
//        NSLog(@"5------->%@",[[MDEasyCache easyCache] objectForKey:@"string_key" completion:^(MDEasyCacheConfig *config) {
//            NSLog(@"---->%@",config.object);
//        }]);
//        NSLog(@"6------->%@",[[MDEasyCache easyCache] objectForKey:@"value_key"]);
//
//    });
//
//}
//
//- (void)imageCacheTest
//{
////    UIImage *image = [UIImage imageNamed:@"launch.jpg"];
////    [[PINCache sharedCache]setObject:image forKey:@"image_key"];
////    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
////        [[PINCache sharedCache]objectForKey:@"image_key" block:^(PINCache * _Nonnull cache, NSString * _Nonnull key, id  _Nullable object) {
////            NSLog(@"------>%@",object);
////
////        }];
////    });
//
//    UIImage *image = [UIImage imageNamed:@"launch.jpg"];
//    [[SDImageCache sharedImageCache] storeImage:image forKey:@"image_key" toDisk:YES completion:^{
//
//    }];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(20 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        UIImage *image1 = [[SDImageCache sharedImageCache] imageFromCacheForKey:@"image_key"];
//        NSLog(@"1------>%@",image1);
//        UIImage *image2 = [[SDImageCache sharedImageCache] imageFromMemoryCacheForKey:@"image_key"];
//        NSLog(@"2------>%@",image2);
//        UIImage *image3 = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:@"image_key"];
//        NSLog(@"3------>%@",image3);
//
//
//    });
//}

@end
