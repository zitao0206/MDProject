//
//  MainViewController.m
//  MDProject
//
//  Created by lizitao on 17/3/12.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MainViewController.h"
#import "MDURLAction.h"
#import "MDNavigator.h"
#import "UIView+ResizeFrame.h"
#import "MDDemoModuleViewcomtroller.h"
#import "MDBaseModuleModel.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *cView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) NSMutableArray <NSString *> *titleArr;
@property (nonatomic, strong) NSMutableArray <MDURLAction *> *actionArr;

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
                       @"Invoker",
                       @"Runtime2",
                       @"Runtime1",
                       @"Core Image/人脸识别",
                       @"Core Image/滤镜",
                       @"Quartz 2D绘图",
                       @"多线程",
                       @"Json动态化",
                       @"DrawImage",
                       @"模块化实例",
                       @"RAC开发",
                       ];
    [self.titleArr addObjectsFromArray:array];
}

- (void)loadActionArray
{
    self.actionArr = [NSMutableArray new];
    {//0
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://invoker"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//1
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://mdruntime2"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//2
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://mdruntime1"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//3
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://mdfacefeatures"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//4
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://mdquartzdraw"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//5
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://mdmultithread"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//6
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://mdjson"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//7
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://mddrawimage"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//8
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://mdbasemodule"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//9
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://rac"]];
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
    return 60.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1)
    {
        MDDemoModuleViewcomtroller *vc = [MDDemoModuleViewcomtroller new];
        MDBaseModuleModel *model = [MDBaseModuleModel new];
        model.title = @"模块化框架";
        vc.model = model;
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    MDURLAction *action = [self.actionArr objectAtIndex:indexPath.row];
    if (action == nil) return;
    [[MDNavigator navigator] openURLAction:action];
}


- (void)viewDidLayoutSubviews
{
    [self.label sizeToFit];
    self.label.top = 0;
    self.label.left = 15;
}

@end
