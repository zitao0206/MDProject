//
//  MDDemoBaseTableViewController.m
//  MDProject
//
//  Created by lizitao on 2018/2/22.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "MDDemoBaseTableViewController.h"
#import "MDDemoTableViewCell.h"
#import "MDDemoTableViewCellModel.h"

@interface MDDemoBaseTableViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray <MDDemoTableViewCellModel *> *titleArr;
@end

@implementation MDDemoBaseTableViewController

- (void)dealloc
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleArr = [NSMutableArray arrayWithCapacity:0];
    
    self.tableView = [[UITableView  alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[MDDemoTableViewCell class] forCellReuseIdentifier:@"MDDemoTableViewCell"];
    self.tableView.hidden = YES;
    [self performSelector:@selector(test) withObject:self afterDelay:2.f];
}

- (void)test
{
    [self loadModelData];
    self.tableView.hidden = NO;
    [self.tableView reloadData];
}


- (void)loadModelData
{
    NSArray <NSString *>*array = @[
                       @"北京",
                       @"上海",
                       @"深圳",
                       @"南京",
                       @"天津",
                       @"苏州",
                       @"合肥",
                       @"三亚",
                       @"海南",
                       @"郑州",
                       @"阜阳",
                       @"芜湖",
                       @"台州",
                       @"台湾",
                       @"香港",
                       @"澳门",
                       @"宿松",
                       @"海口",
                       ];
    for (NSUInteger i = 0; i<array.count; i++) {
        MDDemoTableViewCellModel *model = [MDDemoTableViewCellModel new];
        model.title = [array objectAtIndex:i];
        model.index = [NSString stringWithFormat:@"%@",@(i)];
        [self.titleArr addObject:model];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MDDemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MDDemoTableViewCell"];
    if (!cell) {
        cell = [[MDDemoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MDDemoTableViewCell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.model = [self.titleArr objectAtIndex:indexPath.row];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
}

@end
