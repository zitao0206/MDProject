//
//  MDWebViewViewController.m
//  MDProject
//
//  Created by Leon0206 on 2019/1/6.
//  Copyright © 2019年 Leon0206. All rights reserved.
//

#import "MDWebViewViewController.h"
#import <EasyLayout/EasyLayout.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import <ReactiveDataBoard/ReactiveDataBoard.h>

@interface MDWebViewViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@property (nonatomic, strong) NSURL *url;

@end

@implementation MDWebViewViewController

- (void)dealloc
{
    NSLog(@"-------------------释放了....%@",self);
}

- (BOOL)isSingleton
{
    return NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;

    
    //
    self.url = [NSURL URLWithString:@"https://www.baidu.com"];
    [self initWebView];
    
   
    
    
//    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(60, 60, 100, 45)];
//    view1.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view1];
//    
//    view1.userInteractionEnabled = YES;
//    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTouchUpInside:)];
//    
//    [view1 addGestureRecognizer:labelTapGestureRecognizer];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [[XYReactWhiteBoard shareBoard] setValue:@"hello world" forKey:@"duplicate_signal_test"];
//    });
//    
//    
//    [[[[XYReactWhiteBoard shareBoard] signalForKey:@"duplicate_signal_test"] distinctUntilChanged] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"1执行了。。。。");
//    }];
//    [[[XYReactWhiteBoard shareBoard] signalForKey:@"duplicate_signal_test"] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"2执行了。。。。");
//    }];
//    
//    [[[XYReactWhiteBoard shareBoard] signalForKeyPath:XY_KEYPATH(@"duplicate_signal_test")] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"2执行了。。。。");
//    }];
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
////        [[XYPageMaster master] openUrl:@"mydemo://window" action:nil];
//        
//    });
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)labelTouchUpInside:(UITapGestureRecognizer *)recognizer
{
    MDNaviTransition *naviTransiton = [MDNaviTransition new];
    naviTransiton.animation = MDNaviAnimationTransition;
    naviTransiton.transition.type = kCATransitionReveal;
    naviTransiton.transition.subtype = kCATransitionFromBottom;
    naviTransiton.transition.duration = 2.0;
    [[MDPageMaster master].navigationContorller popCurrentViewControllerWithTransition:naviTransiton];
    
}

- (void)initWebView
{
    self.webView = [[UIWebView alloc] init];
    self.webView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.webView.delegate = self;
    self.webView.backgroundColor = [UIColor greenColor];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:3];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
}

#pragma mark -- WebView delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *url = request.URL.absoluteString;
    
    NSLog(@"----------------->%@",url);
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"------>webViewDidFinishLoad:");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
//    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
//    NSString *alertJS = @"alert('test js OC')"; //注册执行的js代码
//
//    [context evaluateScript:alertJS];
    
    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    context[@"test1"] = ^() {
        NSArray *args = [JSContext currentArguments];
        for (id obj in args) {
            NSLog(@"%@",obj);
        }
    };
    
    
    //一个参数
    NSString *jsFunctStr = @"test1('参数1')";
    //注入JS代码
    [context evaluateScript:jsFunctStr];
    
    
    //二个参数
    NSString *jsFunctStr1 = @"test1('参数a','参数b')";
    //注入JS代码
    [context evaluateScript:jsFunctStr1];
    
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _webView.scrollView.contentInset = UIEdgeInsetsZero;
}


@end
