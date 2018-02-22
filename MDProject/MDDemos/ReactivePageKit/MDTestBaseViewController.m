//
//  MDTestBaseViewController.m
//  XYReactivePageKit
//
//  Created by lizitao on 2018/2/1.
//

#import "MDTestBaseViewController.h"

@interface MDTestBaseViewController ()

@end

@implementation MDTestBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //扩展view
    XYBaseModuleModel *model = [XYBaseModuleModel new];
    model.title = @"hello";
    self.model = model;
}

- (NSArray *)moduleViews
{
    return @[
              @"XYTopModuleView",
              @"XYMiddleModuleView",
              @"XYBottomModuleView",
              @"XYMiddleModuleView",
              @"XYBottomModuleView",
             ];
}

- (CGFloat)spaceBetweenModuleViews
{
    return 15.0;
}

@end
