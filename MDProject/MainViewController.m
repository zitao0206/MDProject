//
//  MainViewController.m
//  MDProject
//
//  Created by lizitao on 17/3/12.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MainViewController.h"
#import "MDModuleViewController.h"
#import "MDURLAction.h"
#import "MDNavigator.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MainViewController

+ (BOOL)isSingleton
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView = [[UITableView  alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
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
       contentCell.textLabel.text = @"模块化案例一";
    }
    else if (indexPath.row == 1)
    {
       contentCell.textLabel.text = @"模块化案例二";
    }
    else
    {
       contentCell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
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
        
//        MDModuleViewController *mdModule = [[MDModuleViewController alloc] init];
//        [self.navigationController pushViewController:mdModule animated:YES];
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"dianping://mdmodule"]];
        [action setString:@"http://www.baidu.com" forKey:@"url"];
        action.animation = MDNaviAnimationPush;
        [[MDNavigator navigator] openURLAction:action];
    }
    else
    {
        
    }
}
@end
