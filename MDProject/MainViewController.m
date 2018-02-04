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
 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!contentCell)
    {
        contentCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    contentCell.backgroundColor = [UIColor lightGrayColor];
    contentCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 0)
    {
       contentCell.textLabel.text = @"RAC开发";
    }
    else if (indexPath.row == 1)
    {
       contentCell.textLabel.text = @"模块化实例";
    }
    else if (indexPath.row == 2)
    {
       contentCell.textLabel.text =@"DrawImage";
    }
    else if (indexPath.row == 3)
    {
        contentCell.textLabel.text =@"Json动态化";
    }
    else if (indexPath.row == 4)
    {
        contentCell.textLabel.text =@"多线程";
    }
    else if (indexPath.row == 5)
    {
        contentCell.textLabel.text =@"Quartz 2D绘图";
    }
    else if (indexPath.row == 6)
    {
        contentCell.textLabel.text =@"Core Image/滤镜";
    }
    else if (indexPath.row == 7)
    {
        contentCell.textLabel.text =@"Core Image/人脸识别";
    }
    else if (indexPath.row == 8)
    {
        contentCell.textLabel.text =@"Runtime";
    }

    return contentCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://rac"]];
        [action setString:@"http://www.baidu.com" forKey:@"url"];
        action.animation = MDNaviAnimationPush;
        [[MDNavigator navigator] openURLAction:action];
    }
    if (indexPath.row == 1)
    {
//        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://mdbasemodule"]];
//        action.animation = MDNaviAnimationPush;
//        [[MDNavigator navigator] openURLAction:action];
        MDDemoModuleViewcomtroller *vc = [MDDemoModuleViewcomtroller new];
        MDBaseModuleModel *model = [MDBaseModuleModel new];
        model.title = @"模块化框架";
        vc.model = model;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 2)
    {
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://mddrawimage"]];
        action.animation = MDNaviAnimationPush;
        [[MDNavigator navigator] openURLAction:action];
    }
    if (indexPath.row == 3)
    {
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://mdjson"]];
        action.animation = MDNaviAnimationPush;
        [[MDNavigator navigator] openURLAction:action];
    }
    if (indexPath.row == 4)
    {
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://mdmultithread"]];
        action.animation = MDNaviAnimationPush;
        [[MDNavigator navigator] openURLAction:action];
    }
    if (indexPath.row == 5)
    {
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://mdquartzdraw"]];
        action.animation = MDNaviAnimationPush;
        [[MDNavigator navigator] openURLAction:action];
    }
    if (indexPath.row == 6)
    {
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://mdfilter"]];
        action.animation = MDNaviAnimationPush;
        [[MDNavigator navigator] openURLAction:action];
    }
    if (indexPath.row == 7)
    {
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://mdfacefeatures"]];
        action.animation = MDNaviAnimationPush;
        [[MDNavigator navigator] openURLAction:action];
    }
    if (indexPath.row == 8)
    {
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://mdruntime"]];
        action.animation = MDNaviAnimationPush;
        [[MDNavigator navigator] openURLAction:action];
    }

}


- (void)viewDidLayoutSubviews
{
    
    [self.label sizeToFit];
    self.label.top = 0;
    self.label.left = 15;
}

@end
