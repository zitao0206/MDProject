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
#import "MDZipArchiveViewController.h"
#import "AppDelegate.h"
#import "MDHopeStateMachingViewController.h"
#import "View+MASAdditions.h"

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
    
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(15);
//        make.left.equalTo(self.view).offset(15);
//    }];

}

- (void)clickBtn1:(UIButton *)sender
{
    
    // 创建一个测试的alertView
    
    UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:@"测试" message:@"测试" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [alterView show];
    UIWindow *window1 = [UIApplication sharedApplication].keyWindow;
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIWindow *window2 = appdelegate.window;
    NSLog(@"\n\nwindow1 = %@    \n\nwindow2 = %@  \n\nwindow1.rootViewController = %@ \n\nwindow2.rootViewController = %@",window1,window2,window1.rootViewController,window2.rootViewController);
    
}


- (void)clickBtn:(UIButton *)sender
{
    // 创建一个测试的alertView
    UIAlertController *alertController =  [UIAlertController alertControllerWithTitle:@"Test" message:@"test..." preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:NSLocalizedString(@"xiaoying_str_com_cancel", @"取消") style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    }];
    
    UIAlertAction *actionAskAgain = [UIAlertAction actionWithTitle:@"Cacel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
    }];
    
    [alertController addAction:actionAskAgain];
    [self presentViewController:alertController animated:YES completion:nil];
    
    UIWindow *window0 = alertController.view.window;
    
    UIWindow *window1 = [UIApplication sharedApplication].keyWindow;
    
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIWindow *window2 = appdelegate.window;
    
    NSLog(@"\nwindow0=%@\nwindow0.rootViewController = %@",window0,window0.rootViewController);
    
    
    NSLog(@"\n\nwindow1 = %@    \n\nwindow2 = %@  \n\nwindow1.rootViewController = %@ \n\nwindow2.rootViewController = %@",window1,window2,window1.rootViewController,window2.rootViewController);
  
    
}



- (void)loadTitleArray
{
    self.titleArr = [NSMutableArray new];
    NSArray *array = @[
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
    {//19
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://transition"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//19
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://window"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//18
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://SDWebImage"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//17
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://stateMaching"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//16
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://zipArchive"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//15
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://jspatch"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//14
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://cache"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//13
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://reactivePage_3"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//12
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://reactivePage_2"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//11
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://reactivePage"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//10
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://invoker"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//9
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://mdruntime2"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//8
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://mdruntime1"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    
    {//7
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://mdfilter"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//6
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://mdfacefeatures"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//5
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://mdquartzdraw"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//4
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://mdmultithread"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//3
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://mdjson"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//2
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://mddrawimage"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//1
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://mdbasemodule"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//0
        MDURLAction *action = [MDURLAction actionWithURL:[NSURL URLWithString:@"mydemo://rac"]];
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
//    if (indexPath.row == 1)
//    {
//        MDDemoModuleViewcomtroller *vc = [MDDemoModuleViewcomtroller new];
//        MDBaseModuleModel *model = [MDBaseModuleModel new];
//        model.title = @"模块化框架";
//        vc.model = model;
//        [self.navigationController pushViewController:vc animated:YES];
//        return;
//    }
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
