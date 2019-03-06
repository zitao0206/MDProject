//
//  MDWebViewViewController.m
//  MDProject
//
//  Created by lizitao on 2019/1/6.
//  Copyright © 2019年 lizitao. All rights reserved.
//

#import "MDWebViewViewController.h"
#import "UIView+ResizeFrame.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface MDWebViewViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@property (nonatomic, strong) NSURL *url;

@end

@implementation MDWebViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
//    self.url = [NSURL URLWithString:@"https://www.baidu.com/"];
//    [self initWebView];
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(60, 60, 100, 45)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    view1.userInteractionEnabled = YES;
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTouchUpInside:)];
    
    [view1 addGestureRecognizer:labelTapGestureRecognizer];
}

- (void)labelTouchUpInside:(UITapGestureRecognizer *)recognizer
{
    XYNaviTransition *naviTransiton = [XYNaviTransition new];
    naviTransiton.animation = XYNaviAnimationTransition;
    naviTransiton.transition.type = kCATransitionReveal;
    naviTransiton.transition.subtype = kCATransitionFromBottom;
    naviTransiton.transition.duration = 2.0;
    [[XYPageMaster master].navigationContorller popCurrentViewControllerWithTransition:naviTransiton];
    
}

- (void)initWebView
{
    self.webView = [[UIWebView alloc] init];
    self.webView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.webView.delegate = self;
    self.webView.scrollView.backgroundColor = [UIColor whiteColor];;
    
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


@end
