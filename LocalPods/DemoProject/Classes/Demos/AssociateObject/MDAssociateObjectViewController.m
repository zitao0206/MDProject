//
//  MDAssociateObjectViewController.m
//  MDHomeProject
//
//  Created by Leon0206 on 2019/9/23.
//

#import "MDAssociateObjectViewController.h"

@interface MDAssociateObjectViewController ()
@end

@implementation MDAssociateObjectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"子VC";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (MDAssociateObject *)obtainAssociateObject
{
    self.associateObject = [MDAssociateObject new];
    return self.associateObject;
}

- (void)test
{
    [self.associateObject print];
}

@end

