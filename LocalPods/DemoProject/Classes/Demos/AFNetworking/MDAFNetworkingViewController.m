//
//  MDAFNetworkingViewController.m
//  MDHomeProject
//
//  Created by Leon0206 on 2019/9/23.
//

#import "MDAFNetworkingViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface MDAFNetworkingViewController ()

@end

@implementation MDAFNetworkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
    [self test1];
    [self af_test_3];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)test
{
    //第一步
    NSURLSessionConfiguration *configration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configration.timeoutIntervalForRequest = 10.0;
    configration.allowsCellularAccess = YES;
    //第二步
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configration];
    //第三部
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.32812/login"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"username=520it&pwd=520it&type=JSON" dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
    }];
    [dataTask resume];
}

- (void)test1
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = @"http://120.25.226.186.32812";
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {

     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

    }];
}


- (void)af_test_3
{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"无网络连接");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi网络");
                break;
            default:
                break;
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

@end
