//
//  MDNavigator.m
//  MDProject
//
//  Created by lizitao on 17/3/12.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDNavigator.h"
#import "MDURLElement.h"
#import "MDBaseViewController.h"

static MDNavigator *gNavigator = nil;
@interface MDNavigator ()
@property (nonatomic, readonly) MDBaseNavigationController *mainNavigationContorller;
@property (nonatomic, readonly) NSString *handleableURLScheme;
@property (nonatomic, readonly) NSArray *fileNamesOfURLMapping;
@property (nonatomic, readonly) BOOL animating;

@end

@implementation MDNavigator
{
    MDBaseNavigationController *_mainNavigationContorller;
    NSMutableDictionary *_urlMapping;
}

@synthesize mainNavigationContorller = _mainNavigationContorller;
@synthesize handleableURLScheme = _handleableURLScheme;
@synthesize fileNamesOfURLMapping = _fileNamesOfURLMapping;

- (id)init
{
    if (self = [super init])
    {
        _handleableURLScheme = @"dianping";
    }
    return self;
}

+ (void)initialize
{
    gNavigator = [[self alloc] init];
}

#pragma mark - public methods

+ (id)navigator
{
    return gNavigator;
}

- (void)setMainNavigationController:(MDBaseNavigationController *)mainViewContorller
{
    _mainNavigationContorller = mainViewContorller;
}

- (void)setHandleableURLScheme:(NSString *)scheme
{
    _handleableURLScheme = scheme;
}

- (void)setFileNamesOfURLMapping:(NSArray *)fileNames
{
    _fileNamesOfURLMapping = fileNames;
    NSLog(@"%@",_fileNamesOfURLMapping);
    
    [self loadViewControllerElements];
}

- (NSMutableDictionary *)loadViewControllerElements
{
    if (_urlMapping)
    {
        [_urlMapping removeAllObjects];
    }
    else
    {
        _urlMapping = [NSMutableDictionary dictionary];
    }
    
    for (int i = 0; i < self.fileNamesOfURLMapping.count; i++)
    {
        NSString *fileName = self.fileNamesOfURLMapping[i];
        NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
        NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        if (content)
        {
            NSArray *eachLine = [content componentsSeparatedByString:@"\n"];
            for (NSString *aString in eachLine)
            {
                if (aString.length < 1)
                {
                    NSLog(@"空行");
                    continue;
                }
                NSString *lineString = [aString stringByReplacingOccurrencesOfString:@" " withString:@""];
                if (lineString.length < 1)
                {
                    //空行
                    continue;
                }
                NSRange commentRange = [lineString rangeOfString:@"#"];
                if (commentRange.location == 0)
                {
                    // #在开头，表明这一行是注释
                    continue;
                }
                if (commentRange.location != NSNotFound)
                {
                    //其后有注释，需要去除后面的注释
                    lineString = [lineString substringToIndex:commentRange.location];
                }
                NSRange tabRange = [lineString rangeOfString:@"\t"];
                BOOL isContainTabT = NO;
                if (tabRange.location != NSNotFound)
                {
                    isContainTabT = YES;
                    //过滤文本编辑器中\t\t\t\t\t
                    lineString = [lineString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
                }
                if ([lineString rangeOfString:@":"].location != NSNotFound)
                {
                    NSString *omitString = [lineString stringByReplacingOccurrencesOfString:@" " withString:@""];
                    NSArray *kv = [omitString componentsSeparatedByString:@":"];
                    if (kv.count == 2)
                    {
                        // got it
                        NSString *host = [kv[0] lowercaseString];
                        NSString *className = kv[1];
                        
                        [_urlMapping setObject:[MDURLElement patternWithClassName:className withKey:host] forKey:host];
                    }
                }
            }
        }
        else
        {
            NSLog(@"[url mapping error] file(%@) is empty!!!!", fileName);
        }
    }
    return _urlMapping;
}

- (UIViewController *)openURLAction:(MDURLAction *)urlAction
{
    return [self openURLAction:urlAction fromViewController:nil];
}

- (UIViewController *)openURLAction:(MDURLAction *)urlAction fromViewController:(UIViewController *)controller
{
    if (![urlAction isKindOfClass:[MDURLAction class]])
    {
        NSLog(@"open url action error urlAction(%@) is not a kind of MDURLAction", NSStringFromClass([urlAction class]));
        return nil;
    }
    return [self handleOpenURLAction:urlAction];
}

- (UIViewController *)handleOpenURLAction:(MDURLAction *)urlAction
{
    MDURLElement *element = [self findElementWithURLAction:urlAction];
    
    UIViewController *controller = [self obtainControllerWithElement:element];
    
    if(!controller)
    {
        return nil;
    }
    
    BOOL isSingleton = NO;
    
    if ([[controller class] respondsToSelector:@selector(isSingleton)])
    {
        isSingleton = [[controller class] isSingleton];
    }
    if (isSingleton)
    {
        [self pushSingletonViewController:controller withURLAction:urlAction];
    }
    else
    {
        [self openViewController:controller withURLAction:urlAction];
    }
    return controller;
}

- (MDURLElement *)findElementWithURLAction:(MDURLAction *)urlAction
{
    if (urlAction.url.host.length < 1)
    {
        return nil;
    }
    return [_urlMapping objectForKey:[urlAction.url.host lowercaseString]];
}

- (UIViewController *)obtainControllerWithElement:(MDURLElement *)element
{
    if (element.targetClass == nil)
    {
       return nil;
    }
    Class class = element.targetClass;
    
    if ([class respondsToSelector:@selector(isSingleton)] && [class isSingleton])
    {
        return [self findViewTargetControllerWith:class] ?: [class new];
    }
    
    return [class new];
}

- (UIViewController *)findViewTargetControllerWith:(Class)class
{
    for (UIViewController *controller in self.mainNavigationContorller.viewControllers)
    {
        if ([controller isKindOfClass:class])
        {
            return controller;
        }
    }
    return nil;
}

- (void)openViewController:(UIViewController *)controller withURLAction:(MDURLAction *)urlAction
{
    controller.urlAction = urlAction;
    if ([controller respondsToSelector:@selector(handleWithURLAction:)])
    {
        if (![((id<MDBaseNavigatorProtocal>)controller) handleWithURLAction:urlAction])
        {
            return;
        }
    }
    
    [self pushViewController:controller withURLAction:urlAction];
}

- (void)pushViewController:(UIViewController *)controller withURLAction:(MDURLAction *)urlAction
{
    // 如果是处理堵塞的页面，一次性压入所有页面，只有最后一个页面使用动画
    MDNaviAnimation animation = MDNaviAnimationNone;
    animation = urlAction.animation;
    [self.mainNavigationContorller pushViewController:controller withAnimation:(animation!=MDNaviAnimationNone)];
}

- (void)pushSingletonViewController:(UIViewController *)controller withURLAction:(MDURLAction *)urlAction
{
    if (!controller)
    {
        return;
    }
    NSMutableArray *controllers = [NSMutableArray arrayWithArray:self.mainNavigationContorller.viewControllers];
    if (controller != [controllers lastObject])
    {
        while (controllers.count > 1)
        {
            [controllers removeLastObject];
            if(controller == [controllers lastObject])
            {
                break;
            }
        }
           
            MDNaviAnimation animation = MDNaviAnimationNone;
            animation = urlAction.animation;
            [self.mainNavigationContorller setViewControllers:controllers animated:(animation!=MDNaviAnimationNone)];
    }
    else
    {
        [controller viewWillAppear:NO];
        [controller viewDidAppear:NO];
    }
}


@end
