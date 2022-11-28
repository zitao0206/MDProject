//
//  MDRACViewController.m
//  MDProject
//
//  Created by Leon0206 on 17/3/12.
//  Copyright © 2017年 Leon0206. All rights reserved.
//

#import "MDRACViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "MDNavigationManager.h"
#import "TestBlockViewController.h"
#import <AKOCommonToolsKit/AKOCommonToolsKit.h>
#import <MDPageMaster/MDPageMaster.h>
#import <ReactiveDataBoard/ReactiveDataBoard.h>


@interface MDRACViewController ()<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate, UITextFieldDelegate>
@property (nonatomic, strong) RACDisposable *dataDisposable;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *sourceArray;

@property (nonatomic, strong) UITextField *myTextField1;
@property (nonatomic, strong) UITextField *myTextField2;
@property (nonatomic, strong) UITextField *myTextField3;

@property (nonatomic, strong) NSString *myTextFieldString1;
@property (nonatomic, strong) NSString *myTextFieldString2;
@property (nonatomic, strong) NSString *myTextFieldString3;

@property (nonatomic, strong) UILabel *resultLabel;

@property (nonatomic, strong) UIButton *resultBtn;

@end

@implementation MDRACViewController

- (void)handleWithURLAction:(MDUrlAction *)urlAction
{
    NSString *string = [urlAction stringForKey:@"url"];
    NSLog(@"1------->%@",string);
}

- (void)viewWillAppear:(BOOL)animated
{


}

- (void)dealloc
{
    NSLog(@"-------------------释放了....%@",self);
//    [self removeObserver:self forKeyPath:@"myTextFieldString1"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [[MDReactWhiteBoard shareBoard] setValue:self forKey:@"whiteKey"];
    
//    self.title = @"VC详情页1";
//    NSLog(@"----------->%@",self.navigationController.viewControllers);
//    NSLog(@"----------->%@",[MDNavigationManager manager].navigationController.viewControllers);
    
//    self.tableView = [[UITableView  alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    self.tableView.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:self.tableView];
//    @weakify(self);
//    [[[RACObserve(self, sourceArray) distinctUntilChanged] filter:^BOOL(NSArray *value) {
//        return [value count]>0?YES:NO;
//    }] subscribeNext:^(id x) {
//        @strongify(self);
//        [self.tableView reloadData];
//    }]
//    [self dataSourceArray];
//    [self coldSignalTest1];
    
//    [self hotSignalTest];
    [self hotSignalTest1];
//    [self multicastSignalTest];
    
    self.myTextField1 = [[UITextField alloc] initWithFrame:CGRectMake(15.0, 80.0, 100.0, 25.0)];
    self.myTextField1.tag = 1000;
    [self.myTextField1 setBackgroundColor:[UIColor grayColor]];
    [self.myTextField1 setDelegate:self];
    [self.myTextField1 addTarget:self action:@selector(onTextFieldChanged:forEvent:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:self.myTextField1];
    
    self.myTextField2 = [[UITextField alloc] initWithFrame:CGRectMake(15.0, 120.0, 100.0, 25.0)];
     self.myTextField2.tag = 1001;
    [self.myTextField2 setBackgroundColor:[UIColor grayColor]];
    [self.myTextField2 setDelegate:self];
    [self.myTextField2 addTarget:self action:@selector(onTextFieldChanged:forEvent:) forControlEvents:UIControlEventEditingChanged];
     [self.view addSubview:self.myTextField2];
    
    self.myTextField3 = [[UITextField alloc] initWithFrame:CGRectMake(15.0, 160.0, 100.0, 25.0)];
     self.myTextField3.tag = 1002;
    [self.myTextField3 setBackgroundColor:[UIColor grayColor]];
    [self.myTextField3 setDelegate:self];
    [self.myTextField3 addTarget:self action:@selector(onTextFieldChanged:forEvent:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:self.myTextField3];
    
    
    self.resultBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.resultBtn.frame=CGRectMake(15, 200, 100, 30);
    self.resultBtn.backgroundColor=[UIColor blueColor];
    [self.resultBtn setTitle:@"计算" forState:UIControlStateNormal];
     [self.resultBtn addTarget:self action:@selector(onValueChanged) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.resultBtn];
   
    
    self.resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 240.0, 200.0, 25.0)];
    self.resultLabel.textColor = [[UIColor grayColor] colorWithAlphaComponent:1.0];
    self.resultLabel.textAlignment = NSTextAlignmentLeft;
    self.resultLabel.font = [UIFont systemFontOfSize:14];
    self.resultLabel.text = @"结果：";
    [self.resultLabel sizeToFit];
    [self.view addSubview:self.resultLabel];
    
//    @weakify(self);
//    RACSignal *signal1 = [RACObserve(self, myTextFieldString1) distinctUntilChanged];
//    RACSignal *signal2 = [RACObserve(self, myTextFieldString2) distinctUntilChanged];
//    RACSignal *signal3 = [RACObserve(self, myTextFieldString3) distinctUntilChanged];
//    RACSignal *resultSignal = [RACSignal combineLatest:@[signal1, signal2, signal3] reduce:^id(NSString *s1, NSString *s2,NSString *s3){
//        NSLog(@"y:----->%@",[NSString stringWithFormat:@"%@",@([s1 integerValue] + [s2 integerValue] +[s3 integerValue])]);
//        return [NSString stringWithFormat:@"%@",@([s1 integerValue] + [s2 integerValue] +[s3 integerValue])];
//    }];
//    [resultSignal subscribeNext:^(id x) {
//        @strongify(self);
//        self.resultLabel.text = [NSString stringWithFormat:@"结果：%@",x];
//        [self.resultLabel sizeToFit];
//    }];
//
    
//    RACSignal *signal_a = [self.myTextField1 rac_textSignal];
//    [signal_a subscribeNext:^(id x) {
//        NSLog(@"a:-------------->%@",x);
//    }];
//    RACSignal *signal_b = [self.myTextField2 rac_textSignal];
//    [signal_a subscribeNext:^(id x) {
//        NSLog(@"b:-------------->%@",x);
//    }];
//    RACSignal *signal_c = [self.myTextField3 rac_textSignal];
//    [signal_a subscribeNext:^(id x) {
//        NSLog(@"c:-------------->%@",x);
//    }];
////
//    RACSignal *signal_y = [RACSignal combineLatest:@[signal_a, signal_b, signal_c] reduce:^id(NSString *s1, NSString *s2, NSString *s3){
////        return s1.length > 0;
//        return  [NSString stringWithFormat:@"%@",@([s1 integerValue]+[s2 integerValue]+[s3 integerValue])];
//    }];
//    [[signal_y distinctUntilChanged] skip:1];
//
//    [signal_y subscribeNext:^(id x) {
//        @strongify(self);
//        self.resultLabel.text = [NSString stringWithFormat:@"结果：%@",x];
//        [self.resultLabel sizeToFit];
//    }];

    
//    [self addObserver:self forKeyPath:@"myTextFieldString1" options:NSKeyValueObservingOptionOld context:nil];
//
//    RACSignal *signal = RACObserve(self, myTextFieldString1);
//    [signal distinctUntilChanged];
//    [signal subscribeNext:^(id x) {
//
//    }];

    
}


- (void)onTextFieldChanged:(UITextField *)textField forEvent:(UIEvent *)event
{
    if (textField.tag == 1000) {
        NSLog(@"Result------->%@",self.resultLabel.text);
         self.myTextFieldString1 = textField.text;
        NSLog(@"Result------->%@",self.resultLabel.text);
    }
    if (textField.tag == 1001) {
        self.myTextFieldString2 = textField.text;
    }
    if (textField.tag == 1002) {
        self.myTextFieldString3 = textField.text;
    }
    [self onValueChanged];
}

- (void)onValueChanged
{
    NSInteger result = [self.myTextFieldString1 integerValue] + [self.myTextFieldString2 integerValue] +[self.myTextFieldString3 integerValue];
    self.resultLabel.text = [NSString stringWithFormat:@"结果：%@",@(result)];
    [self.resultLabel sizeToFit];
}


- (void)onRacValueChanged
{
    NSInteger result = [self.myTextFieldString1 integerValue] + [self.myTextFieldString2 integerValue] +[self.myTextFieldString3 integerValue];
    self.resultLabel.text = [NSString stringWithFormat:@"结果：%@",@(result)];
    [self.resultLabel sizeToFit];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    id oldName = [change objectForKey:NSKeyValueChangeOldKey];
    NSLog(@"oldName----------%@",oldName);
    id newName = [change objectForKey:NSKeyValueChangeNewKey];
    NSLog(@"newName-----------%@",newName);
    //当界面要消失的时候,移除kvo
    //    [object removeObserver:self forKeyPath:@"name"];
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
    //信号的创建
  
    NSLog(@"Signal in.");
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"被订阅者代码执行");
//        [[RACScheduler mainThreadScheduler] afterDelay:0.3 schedule:^{
            [subscriber sendNext:@"信号的发送"]; //信号的发送
           [subscriber sendCompleted];
        [subscriber sendNext:@"信号的发送1"]; //信号的发送
//        }];
        return nil;
    }];
    //信号的订阅者
    NSLog(@"Signal was created.");
    [[RACScheduler mainThreadScheduler] afterDelay:3.0 schedule:^{
        NSLog(@"订阅者代码执行");
        [signal subscribeNext:^(id x) {
            NSLog(@"recveive: %@", x);
        }];
    }];
}


- (void)coldSignalTest1
{
    //信号的创建
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"被订阅者代码执行");
        [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
            [subscriber sendNext:@"一月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:2 schedule:^{
            [subscriber sendNext:@"二月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:3 schedule:^{
            [subscriber sendNext:@"三月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:4 schedule:^{
            [subscriber sendNext:@"四月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:5 schedule:^{
            [subscriber sendNext:@"五月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:6 schedule:^{
            [subscriber sendNext:@"六月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:7 schedule:^{
            [subscriber sendNext:@"七月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:8 schedule:^{
            [subscriber sendNext:@"八月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:9 schedule:^{
            [subscriber sendNext:@"九月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:10 schedule:^{
            [subscriber sendNext:@"十月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:11 schedule:^{
            [subscriber sendNext:@"十一月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:12 schedule:^{
            [subscriber sendNext:@"十二月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:13 schedule:^{
            [subscriber sendCompleted]; //信号的取消订阅
        }];
        return nil;
    }];
    //信号的订阅者
    NSLog(@"Signal was created.");
    [[RACScheduler mainThreadScheduler] afterDelay:7.0 schedule:^{
        NSLog(@"订阅者代码执行");
        [signal subscribeNext:^(id x) {
            NSLog(@"小明 recveive: %@", x);
        }];
    }];
}

- (void)hotSignalTest1
{
    RACSubject *signal = [RACSubject subject];
    [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
        [signal sendNext:@"一月份的《读者》"]; //信号的发送
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:2 schedule:^{
        [signal sendNext:@"二月份的《读者》"]; //信号的发送
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:3 schedule:^{
        [signal sendNext:@"三月份的《读者》"]; //信号的发送
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:4 schedule:^{
        [signal sendNext:@"四月份的《读者》"]; //信号的发送
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:5 schedule:^{
        [signal sendNext:@"五月份的《读者》"]; //信号的发送
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:6 schedule:^{
        [signal sendNext:@"六月份的《读者》"]; //信号的发送
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:7 schedule:^{
        [signal sendNext:@"七月份的《读者》"]; //信号的发送
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:8 schedule:^{
        [signal sendNext:@"八月份的《读者》"]; //信号的发送
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:9 schedule:^{
        [signal sendNext:@"九月份的《读者》"]; //信号的发送
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:10 schedule:^{
        [signal sendNext:@"十月份的《读者》"]; //信号的发送
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:11 schedule:^{
        [signal sendNext:@"十一月份的《读者》"]; //信号的发送
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:12 schedule:^{
        [signal sendNext:@"十二月份的《读者》"]; //信号的发送
    }];
    
    NSLog(@"Signal was created.");
    [[RACScheduler mainThreadScheduler] afterDelay:7.0 schedule:^{
        [signal subscribeNext:^(id x) {
            NSLog(@"小明 recveive: %@", x);
        }];
    }];
}

- (void)hotSignalTest
{
    RACMulticastConnection *connection = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
            [subscriber sendNext:@"一月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:2 schedule:^{
            [subscriber sendNext:@"二月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:3 schedule:^{
            [subscriber sendNext:@"三月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:4 schedule:^{
            [subscriber sendNext:@"四月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:5 schedule:^{
            [subscriber sendNext:@"五月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:6 schedule:^{
            [subscriber sendNext:@"六月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:7 schedule:^{
            [subscriber sendNext:@"七月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:8 schedule:^{
            [subscriber sendNext:@"八月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:9 schedule:^{
            [subscriber sendNext:@"九月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:10 schedule:^{
            [subscriber sendNext:@"十月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:11 schedule:^{
            [subscriber sendNext:@"十一月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:12 schedule:^{
            [subscriber sendNext:@"十二月份的《读者》"]; //信号的发送
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:13 schedule:^{
            [subscriber sendCompleted]; //信号的取消订阅
        }];
        return nil;
    }] publish];
    [connection connect];
    RACSignal *signal = connection.signal;
    
    NSLog(@"Signal was created.");
    [[RACScheduler mainThreadScheduler] afterDelay:7.0 schedule:^{
        [signal subscribeNext:^(id x) {
            NSLog(@"小明 recveive: %@", x);
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
    //[self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
    TestBlockViewController *vc = [[TestBlockViewController alloc] initWithBlock:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
