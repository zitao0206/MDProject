//
//  MDTestBaseViewController.m
//  XYReactivePageKit
//
//  Created by lizitao on 2018/2/1.
//

#import "MDTestBaseViewController.h"
#import "MDTestBaseView.h"

@interface MDTestBaseViewController ()
@property (nonatomic, strong) MDTestBaseView *testBaseView;
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
    
    self.testBaseView = [[MDTestBaseView alloc]initWithFrame:CGRectMake(30, 60, 100, 400)];
    [self.view addSubview:self.testBaseView];
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
