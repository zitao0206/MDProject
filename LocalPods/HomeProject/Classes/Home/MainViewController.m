//
//  MainViewController.m
//  MDProject
//
//  Created by lizitao on 17/3/12.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MainViewController.h"
#import <MDPageMaster/MDPageMaster.h>
#import <EasyLayout/EasyLayout.h>
#import "MDDemoModuleViewcomtroller.h"
#import "MDBaseModuleModel.h"
#import "MDZipArchiveViewController.h"
#import "AppDelegate.h"
#import "MDHopeStateMachingViewController.h"
#import "View+MASAdditions.h"
#import <ReactiveDataBoard/ReactiveDataBoard.h>

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *cView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) NSMutableArray <NSString *> *titleArr;
@property (nonatomic, strong) NSMutableArray <MDUrlAction *> *actionArr;

@property (nonatomic, strong) NSMutableArray *mutableArray;

@end

@implementation MainViewController

+ (BOOL)isSingleton
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView = [[UITableView  alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    [self loadTitleArray];
    [self loadActionArray];
    
}

- (void)loadTitleArray
{
    self.titleArr = [NSMutableArray new];
    NSArray *array = @[
        @"WeakInstance",                  //26
        @"MultiRoleView",                  //25
        @"HoverView",                     //24
        @"AFNetworking",                     //23
        @"WebView",                          //22
        @"MDFelix",                          //21
        @"CATransition",                     //20
        @"window",                           //19
        @"SDWebImage",                       //18
        @"stateMaching",                     //17
        @"ZipTest",                          //16
        @"JSPatch",                          //15
        @"EasyCache",                        //14
        @"ReactivePage_3",                   //13
        @"ReactivePage_2",                   //12
        @"ReactivePage",                     //11
        @"Invoker",                          //10
        @"Runtime2",                         //9
        @"Runtime1",                         //8
        @"Core Image/人脸识别",                //7
        @"Core Image/滤镜",                   //6
        @"Quartz 2D绘图",                     //5
        @"多线程",                            //4
        @"Json动态化",                        //3
        @"DrawImage",                        //2
        @"模块化实例",                         //1
        @"RAC开发",                           //0
    ];
    [self.titleArr addObjectsFromArray:array];
}

- (void)loadActionArray
{
    self.actionArr = [NSMutableArray new];
    {//26
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://WeakInstance"]];
        [self.actionArr addObject:action];
    }
    {//25
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://multirole"]];
        [self.actionArr addObject:action];
    }
    {//24
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://hover"]];
        [self.actionArr addObject:action];
    }
    {//23
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://afn"]];
        [self.actionArr addObject:action];
    }
    {//22
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://webview"]];
        [self.actionArr addObject:action];
    }
    {//21
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://hotfix"]];
        [self.actionArr addObject:action];
    }
    {//20
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://transition"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//19
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://window"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//18
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://SDWebImage"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//17
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://stateMaching"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//16
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://zipArchive"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//15
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://jspatch"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//14
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://cache"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//13
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://reactivePage_3"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//12
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://reactivePage_2"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//11
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://reactivePage"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//10
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://invoker"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//9
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdruntime2"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//8
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdruntime1"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    
    {//7
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdfilter"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//6
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdfacefeatures"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//5
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdquartzdraw"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//4
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdmultithread"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//3
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdjson"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//2
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mddrawimage"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//1
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdbasemodule"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//0
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://rac"]];
        [action setString:@"http://www.baidu.com" forKey:@"url"];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!contentCell) {
        contentCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    contentCell.backgroundColor = [UIColor lightGrayColor];
    contentCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    contentCell.textLabel.text = [self.titleArr objectAtIndex:indexPath.row];
    return contentCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 100.0;
    }
    return 50.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    if (indexPath.row == 0)
    //    {
    //        BOOL isPhone = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]];
    //        NSLog(@"----->isPhone:%@",@(isPhone));
    
    //        [[XYPageMaster master] openUrl:@"mydemo://webview" action:^(XYUrlAction * _Nullable action) {
    //            XYNaviTransition *naviTransiton = [XYNaviTransition new];
    //            naviTransiton.animation = XYNaviAnimationTransition;
    //            naviTransiton.transition.type = kCATransitionMoveIn;
    //            naviTransiton.transition.subtype = kCATransitionFromTop;
    //            naviTransiton.transition.duration = 0.3;
    //            action.naviTransition = naviTransiton;
    //        }];
    //        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"xiaoying://url=www.baidu.com"]];
    //    } else {
    MDUrlAction *action = [self.actionArr objectAtIndex:indexPath.row];
    if (action == nil) return;
    [[MDPageMaster master] openURLAction:action];
    //    }
    
}


- (void)viewDidLayoutSubviews
{
    [self.label sizeToFit];
    self.label.top = 0;
    self.label.left = 15;
}

@end
