//
//  MDWindowViewController.m
//  MDProject
//
//  Created by lizitao on 2018/9/17.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDWindowViewController.h"
#import "XYReactWhiteBoard.h"

@interface MDWindowViewController ()

@end

@implementation MDWindowViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[[XYReactWhiteBoard shareBoard] signalForKey:@"duplicate_signal_test"] subscribeNext:^(id  _Nullable x) {
        NSLog(@"3执行了。。。。");
    }];
    [[[XYReactWhiteBoard shareBoard] signalForKey:@"duplicate_signal_test"] subscribeNext:^(id  _Nullable x) {
        NSLog(@"4执行了。。。。");
    }];
   
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
//    UIAlertController *alter = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"xiaoying_str_delete_usage_data", @"删除我的使用数据") message:NSLocalizedString(@"xiaoying_str_msg_delete_usage_data", @"是否删除您在服务器上的所有使用数据？删除后这些数据将不可恢复，并且App会在删除该数据后自动退出") preferredStyle:UIAlertControllerStyleAlert];
//
//    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:NSLocalizedString(@"xiaoying_str_com_cancel", @"取消") style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//    }];
//
//    UIAlertAction *actionAskAgain = [UIAlertAction actionWithTitle:NSLocalizedString(@"xiaoying_str_com_delete_title", @"删除") style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
//
//    }];
//
//    [alter addAction:actionCancel];
//    [alter addAction:actionAskAgain];
//
//    [self presentViewController:alter animated:YES completion:nil];
    UIAlertView *alertViewTemp = [[UIAlertView alloc] initWithTitle:@"1"
                                                            message:@"2"
                                                           delegate:self
                                                  cancelButtonTitle:@"3"
                                                  otherButtonTitles:nil, nil];
    [alertViewTemp show];
}

@end
