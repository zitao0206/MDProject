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
#import "MDCrashShieldManager.h"
#import <XYPageMaster/XYPageMaster.h>

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
    {
//        [[MDCrashShieldManager manager] startPatch];
//        NSString *txtPath = [[NSBundle mainBundle] pathForResource:@"bugfix" ofType:@"js"];
        
    }
    [self windowNotificationRegist];
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
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
