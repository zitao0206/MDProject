//
//  MDRACViewController.m
//  MDProject
//
//  Created by lizitao on 17/3/12.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDRACViewController.h"
#import "MDNavigator.h"
#import "RACDisposable.h"
#import "RACSignal.h"
#import "RACScheduler.h"
#import "RACSubscriber.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface MDRACViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) RACDisposable *dataDisposable;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *sourceArray;

@end

@implementation MDRACViewController

- (BOOL)handleWithURLAction:(MDURLAction *)urlAction
{
    NSString *string = [urlAction stringForKey:@"url"];
    NSLog(@"1------->%@",string);
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"VC详情页1";
    NSLog(@"----------->%@",self.navigationController.viewControllers);
    self.tableView = [[UITableView  alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    @weakify(self);
    [[[RACObserve(self, sourceArray) distinctUntilChanged] filter:^BOOL(NSArray *value) {
        return [value count]>0?YES:NO;
    }] subscribeNext:^(id x) {
        @strongify(self);
        [self.tableView reloadData];
    }];
    [self dataSourceArray];
}

- (void)dataSourceArray
{
    [self.dataDisposable dispose];
    @weakify(self);
    self.dataDisposable = [[self fetchDataSignal] subscribeNext:^(NSArray *data) {
        @strongify(self);
        if ([data isKindOfClass:[NSArray class]]) {
            self.sourceArray = data;
        }
        [self.dataDisposable dispose];
    }];
}


- (RACSignal *)fetchDataSignal
{
    RACSignal *signal = [RACSignal startEagerlyWithScheduler:[RACScheduler mainThreadScheduler] block:^(id<RACSubscriber> subscriber) {
        NSArray <NSString *> *tempArray = @[@"Hefei",@"Suzhou",@"Beijing",@"Shanghai",@"Hangzhou",@"Nanjing",@"Shenzhen",@"Tianjing",@"Wuxi"];
        [subscriber sendNext:tempArray];
        [subscriber sendCompleted];
    }];
    return signal;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sourceArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!contentCell) {
        contentCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    contentCell.backgroundColor = [UIColor lightGrayColor];
    contentCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    contentCell.textLabel.text = [self.sourceArray objectAtIndex:indexPath.row];
    return contentCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
    } else {
        
    }
}

@end
