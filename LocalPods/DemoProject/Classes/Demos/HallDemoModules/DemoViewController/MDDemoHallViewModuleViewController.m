//
//  MDSubHallViewModuleViewController.m
//  MDProject
//
//  Created by Leon0206 on 2018/4/15.
//

#import "MDDemoHallViewModuleViewController.h"
#import "MDDemoHallCollectionView.h"
#import "MDDemoHallCollectionVModels.h"

@interface MDDemoHallViewModuleViewController()
@property (nonatomic, strong) MDDemoHallCollectionView *hallView;
@end

@implementation MDDemoHallViewModuleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.hallView];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        MainTopModel *topModel1 = [MainTopModel new];
        topModel1.title = @"一";
        MainTopModel *topModel2 = [MainTopModel new];
        topModel2.title = @"二";
        MainMiddleModel *middleModel1 = [MainMiddleModel new];
        middleModel1.number = @"三";
        MainMiddleModel *middleModel2 = [MainMiddleModel new];
        middleModel2.number = @"四";
        NSArray *listData = @[topModel1, topModel2, middleModel1, middleModel2];
        
        self.hallView.model = listData;
        
    });
   
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.hallView.top = 200;
    self.hallView.height = 300;
    self.hallView.width = kScreenWidth - 30;
    self.hallView.left = 15;
    self.hallView.backgroundColor = [[UIColor greenColor]colorWithAlphaComponent:0.3];
}

- (MDDemoHallCollectionView *)hallView
{
    if (!_hallView) {
        _hallView = [[MDDemoHallCollectionView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    }
    return _hallView;
}

@end
