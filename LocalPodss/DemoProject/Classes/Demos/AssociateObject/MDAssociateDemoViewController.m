//
//  MDAssociateDemoViewController.m
//  MDHomeProject
//
//  Created by Leon0206 on 2019/9/23.
//

#import "MDAssociateDemoViewController.h"
#import "MDAssociateObject.h"
#import "MDAssociateObjectViewController.h"
#import <objc/runtime.h>

@interface MDAssociateDemoViewController (BaseProperty)

@property(nonatomic, weak) MDAssociateObject *associateObject;

@end

@implementation MDAssociateDemoViewController (BaseProperty)

- (MDAssociateObject *)associateObject
{
    return objc_getAssociatedObject(self, @selector(associateObject));
}

- (void)setAssociateObject:(MDAssociateObject *)associateObject
{
    objc_setAssociatedObject(self, @selector(associateObject), associateObject, OBJC_ASSOCIATION_ASSIGN);
}

@end

@interface MDAssociateDemoViewController ()
@property(nonatomic, weak) MDAssociateObject *associateObject;
@end

@implementation MDAssociateDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self test];
    });
    self.title = @"主VC";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)test
{
    MDAssociateObjectViewController *vc = [MDAssociateObjectViewController new];
    self.associateObject = [vc obtainAssociateObject];
    [self.navigationController pushViewController:vc animated:YES];
    
    [self.associateObject print];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.associateObject print];
        
    });
    
}

@end

