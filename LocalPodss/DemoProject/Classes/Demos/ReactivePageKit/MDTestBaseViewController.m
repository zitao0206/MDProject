//
//  MDTestBaseViewController.m
//  XYReactivePageKit
//
//  Created by Leon0206 on 2018/2/1.
//

#import "MDTestBaseViewController.h"
#import <ReactiveDataBoard/ReactiveDataBoard.h>

@interface MDTestBaseViewController ()

@property (nonatomic, strong) ReactiveBlackBoard *blackBoard;

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
    
//    [[self.blackBoard addObserver:self forKey:@"hello123"] subscribeNext:^(id  _Nullable x) {
//         NSLog(@"------->%@",x);
//    }];
//    
//    [[self.blackBoard addObserver:self forKey:@"hello"] subscribeNext:^(id  _Nullable x) {
//         NSLog(@"------->%@",x);
//    }];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.blackBoard setValue:@"123" forKey:@"hello"];
        [self.blackBoard setValue:@"1234567" forKey:@"hello123"];
    });
}

- (ReactiveBlackBoard *)blackBoard
{
    if(nil == _blackBoard){
        _blackBoard = [[ReactiveBlackBoard alloc] init];
    }
    return _blackBoard;
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
