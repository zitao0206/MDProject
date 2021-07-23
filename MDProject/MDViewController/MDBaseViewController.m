//
//  MDBaseViewController.m
//  Nova
//
//  Created by lizitao on 12-5-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MDBaseViewController.h"

@implementation UIViewController (MDURLAction)

- (BOOL)handleWithURLAction:(XYUrlAction *)urlAction
{
    return YES;
}

@end

@interface MDBaseViewController()

@end

@implementation MDBaseViewController

+ (BOOL)isSingleton
{
    return NO;
}

- (BOOL)handleWithURLAction:(XYUrlAction *)urlAction
{
    self.urlAction = urlAction;
    
    return YES;
}

- (id)init
{
    if(self = [super init])
    {
        [self innerInitBaseMethod];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)innerInitBaseMethod
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    [self setLeftNavigationItem];
}

- (void)setLeftNavigationItem
{
    UIBarButtonItem *returnItem = [[UIBarButtonItem alloc] init];
    returnItem.title = @"";
    self.navigationItem.backBarButtonItem = returnItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)customDismissModalFromMainController:(id)_
{
    [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - InterfaceOrientation

- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldUseSearchableUserActivity
{
    return NO;
}

- (void)setNeedReloadUserActivity
{
    [self.userActivity setNeedsSave:YES];
}

- (void)dealloc
{
    NSLog(@"!!!!!!!!!!!%@ dealloc!", NSStringFromClass([self class]));
}

@end
