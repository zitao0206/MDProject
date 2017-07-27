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
#import "MDNavigationManager.h"

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

- (void)viewWillAppear:(BOOL)animated
{


}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"VC详情页1";
    NSLog(@"----------->%@",self.navigationController.viewControllers);
    NSLog(@"----------->%@",[MDNavigationManager manager].navigationController.viewControllers);
    
    self.tableView = [[UITableView  alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
//    @weakify(self);
//    [[[RACObserve(self, sourceArray) distinctUntilChanged] filter:^BOOL(NSArray *value) {
//        return [value count]>0?YES:NO;
//    }] subscribeNext:^(id x) {
//        @strongify(self);
//        [self.tableView reloadData];
//    }];
    [self dataSourceArray];
//    [self coldSignalTest];
    
//    [self hotSignalTest];
    [self multicastSignalTest];
    
}

- (void)multicastSignalTest
{
    // This signal starts a new request on each subscription.
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@1];
        [subscriber sendNext:@2];
        [subscriber sendCompleted];
        return nil;
    }];

    RACMulticastConnection *connection = [signal multicast:[RACReplaySubject subject]];
    [connection connect];
    
    [connection.signal subscribeNext:^(id response) {
        NSLog(@"subscriber one: %@", response);
    }];
    
    [connection.signal subscribeNext:^(id response) {
        NSLog(@"subscriber two: %@", response);
    }];

}

- (void)coldSignalTest
{
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
            [subscriber sendNext:@1];
//        }];
        
//        [[RACScheduler mainThreadScheduler] afterDelay:10 schedule:^{
//            [subscriber sendNext:@2];
//        }];
//        
//        [[RACScheduler mainThreadScheduler] afterDelay:3 schedule:^{
//            [subscriber sendNext:@3];
//        }];
//        [[RACScheduler mainThreadScheduler] afterDelay:4 schedule:^{
//            [subscriber sendNext:@4];
//        }];
        
        [[RACScheduler mainThreadScheduler] afterDelay:4 schedule:^{
            [subscriber sendCompleted];
        }];
        return nil;
    }];
        NSLog(@"Signal was created.");
//    [[RACScheduler mainThreadScheduler] afterDelay:5.1 schedule:^{
        [signal subscribeNext:^(id x) {
            
            NSLog(@"Subscriber 1 recveive: %@", x);
            
        }];
//    }];
    
//    [[RACScheduler mainThreadScheduler] afterDelay:1.0 schedule:^{
        [signal subscribeNext:^(id x) {
            NSLog(@"Subscriber 2 recveive: %@", x);
        }];
//    }];
}

- (void)hotSignalTest
{
    RACMulticastConnection *connection = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
            [subscriber sendNext:@1];
        }];
        
        [[RACScheduler mainThreadScheduler] afterDelay:2 schedule:^{
            [subscriber sendNext:@2];
        }];
        
        [[RACScheduler mainThreadScheduler] afterDelay:3 schedule:^{
            [subscriber sendNext:@3];
        }];
        
        [[RACScheduler mainThreadScheduler] afterDelay:4 schedule:^{
            [subscriber sendCompleted];
        }];
        return nil;
    }] publish];
    [connection connect];
    RACSignal *signal = connection.signal;
    
    NSLog(@"Signal was created.");
    [[RACScheduler mainThreadScheduler] afterDelay:1.1 schedule:^{
        [signal subscribeNext:^(id x) {
            NSLog(@"Subscriber 1 recveive: %@", x);
        }];
    }];
    
    [[RACScheduler mainThreadScheduler] afterDelay:2.1 schedule:^{
        [signal subscribeNext:^(id x) {
            NSLog(@"Subscriber 2 recveive: %@", x);
        }];
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:5.1 schedule:^{
        [signal subscribeNext:^(id x) {
            NSLog(@"Subscriber 3 recveive: %@", x);
        }];
    }];
}

- (void)dataSourceArray
{
    [self.dataDisposable dispose];
    @weakify(self);
    self.dataDisposable = [[self fetchDataSignal] subscribeNext:^(NSArray *data) {
        @strongify(self);
        if ([data isKindOfClass:[NSArray class]]) {
            self.sourceArray = data;
            [self.tableView reloadData];
        }
        [self.dataDisposable dispose];
    }];
}


- (RACSignal *)fetchDataSignal
{
    RACSignal *signal = [RACSignal startEagerlyWithScheduler:[RACScheduler mainThreadScheduler] block:^(id<RACSubscriber> subscriber) {
        NSArray <NSString *> *tempArray = @[@"Hefei",
                                            @"Suzhou",
                                            @"Beijing1",
                                            @"Beijing2",
                                            @"Beijing3",
                                            @"Beijing4",
                                            @"Beijing5",
                                            @"Beijing6",
                                            @"Beijing7",
                                            @"Beijing8",
                                            @"Beijing9",
                                            @"Beijing10",
                                            @"Beijing11",
                                            @"Beijing12",
                                            @"Beijing13",
                                            @"Beijing14",
                                            @"Wuxi"];
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
    return 100.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
