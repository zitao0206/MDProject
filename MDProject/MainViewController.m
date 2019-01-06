//
//  MainViewController.m
//  MDProject
//
//  Created by lizitao on 17/3/12.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MainViewController.h"
#import "XYUrlAction.h"
#import "UIView+ResizeFrame.h"
#import "MDDemoModuleViewcomtroller.h"
#import "MDBaseModuleModel.h"
#import "MDZipArchiveViewController.h"
#import "AppDelegate.h"
#import "MDHopeStateMachingViewController.h"
#import "View+MASAdditions.h"
#import "XYPageMaster.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *cView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) NSMutableArray <NSString *> *titleArr;
@property (nonatomic, strong) NSMutableArray <XYUrlAction *> *actionArr;

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
                       @"XYFelix",                          //21
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
    {//22
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://webview"]];
        [self.actionArr addObject:action];
    }
    {//21
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://hotfix"]];
        [self.actionArr addObject:action];
    }
    {//20
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://transition"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//19
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://window"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//18
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://SDWebImage"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//17
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://stateMaching"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//16
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://zipArchive"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//15
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://jspatch"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//14
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://cache"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//13
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://reactivePage_3"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//12
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://reactivePage_2"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//11
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://reactivePage"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//10
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://invoker"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//9
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdruntime2"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//8
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdruntime1"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    
    {//7
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdfilter"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//6
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdfacefeatures"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//5
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdquartzdraw"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//4
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdmultithread"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//3
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdjson"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//2
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mddrawimage"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//1
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdbasemodule"]];
        action.animation = XYNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//0
        XYUrlAction *action = [XYUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://rac"]];
        [action setString:@"http://www.baidu.com" forKey:@"url"];
        action.animation = XYNaviAnimationPush;
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
    XYUrlAction *action = [self.actionArr objectAtIndex:indexPath.row];
    if (action == nil) return;
    [[XYPageMaster master] openURLAction:action];
}


- (void)viewDidLayoutSubviews
{
    [self.label sizeToFit];
    self.label.top = 0;
    self.label.left = 15;
}

@end
