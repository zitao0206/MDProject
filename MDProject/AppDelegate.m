//
//  AppDelegate.m
//  MDProject
//
//  Created by lizitao on 17/3/12.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "MDNavigationManager.h"

#import <XYPageMaster/XYPageMaster.h>
//#import <XYFelix/XYFelix.h>

typedef NS_ENUM(NSInteger, LaunchMode) {
    LaunchModeNormal = 0,
    LaunchModeFast,
    LaunchModeBackgroundNotification,
    LaunchModeBackgroundLocation
};

@interface AppDelegate ()
@property (nonatomic, assign) LaunchMode launchMode;

@end

@implementation AppDelegate

- (LaunchMode)launchModeForLaunchOptions:(NSDictionary *)launchOptions
{
    if (launchOptions == nil)
    {
        return LaunchModeNormal;
    }
    else
    {
        NSDictionary *pushUserInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        if (pushUserInfo && [[[pushUserInfo objectForKey:@"aps"] objectForKey:@"content-available"] integerValue] == 1)
        {
            return LaunchModeBackgroundNotification;
        }
        if ([launchOptions objectForKey:UIApplicationLaunchOptionsLocationKey])
        {
            return LaunchModeBackgroundLocation;
        }
        return LaunchModeFast;
    }
}

- (BOOL)isBackgroundLaunch
{
    return self.launchMode == LaunchModeBackgroundLocation || self.launchMode == LaunchModeBackgroundNotification;
}

- (void)doBackgroundLaunchJobs
{
    NSLog(@"doBackgroundLaunchJobs: %@", @(self.launchMode));
}

- (void)doForegroundLaunchJobs
{
    NSLog(@"doForegroundLaunchJobs: %@", @(self.launchMode));
    
    [self setupNavigator];
    
    [self.window makeKeyAndVisible];
}

- (void)setupNavigator
{
    NSDictionary *params = @{@"schema":@"mydemo",@"pagesFile":@"urlmapping",@"rootVC":@"MainViewController"};
    [[XYPageMaster master] setupNavigationControllerWithParams:params];
    self.window.rootViewController = [XYPageMaster master].navigationContorller;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.launchMode = [self launchModeForLaunchOptions:launchOptions];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [MDNavigationManager manager];
    if ([self isBackgroundLaunch])
    {
        [self doBackgroundLaunchJobs];
        NSLog(@"background launch:%@ -- %@", @(self.launchMode), launchOptions.description);
    } else {
        [self doForegroundLaunchJobs];
        NSLog(@"foreground launch:%@ -- %@", @(self.launchMode), launchOptions.description);
    }
    [self windowNotificationRegist];
    {
        //hotfix
        NSString *js_path = [[NSBundle mainBundle] pathForResource:@"bugfix" ofType:@"js"];
        NSString *js_string = [NSString stringWithContentsOfFile:js_path encoding:NSASCIIStringEncoding error:nil];
//        [XYFelix fixIt];
//        [XYFelix evalString:js_string];
//        NSLog(@"hotfix....%@",js_string);
    }
    return YES;
}

- (void)windowNotificationRegist
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(windowDidBecomeKey:) name:UIWindowDidBecomeKeyNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(windowDidResignKey:) name:UIWindowDidResignKeyNotification object:nil];
}


- (void)windowDidBecomeKey:(NSNotification *)notification
{
    NSLog(@"1  --1-----  windowDidBecomeKey: %@",notification.object);
}

- (void)windowDidResignKey:(NSNotification *)notification
{
    NSLog(@"1  --2-----  windowDidResignKey: %@",notification.object);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
