//
//  MDHoverViewController.m
//  MDProject
//
//  Created by Leon0206 on 17/3/12.
//  Copyright © 2017年 Leon0206. All rights reserved.
//

#import "MDHoverViewController.h"
#import <MDPageMaster/MDPageMaster.h>
#import <EasyLayout/EasyLayout.h>
#import <AKOCommonToolsKit/UIColor+Ext.h>
#import "MDDemoModuleViewcomtroller.h"
#import <StateMachinePageKit/StateMachinePageKit.h>
#import "MDZipArchiveViewController.h"
#import "MDHopeStateMachingViewController.h"
#import <ReactiveDataBoard/ReactiveDataBoard.h>
#import "MDHoverTopCell.h"
#import "MDHoverContainerCell.h"
#import "FDSlideBar.h"
#import "MDGestureTableView.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_WINDOW_HEIGHT (SCREEN_HEIGHT-(STATUS_HEIGHT+44))
#define STATUS_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height//状态栏高度
#define sliderHeight 49

@interface MDHoverViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) MDGestureTableView *tableView;
@property (nonatomic, strong) UIView *cView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) NSMutableArray <NSString *> *titleArr;
@property (nonatomic, strong) NSMutableArray <MDUrlAction *> *actionArr;
@property (nonatomic, strong) MDHoverContainerCell *containerCell;
@property (nonatomic, strong) FDSlideBar *sliderView;
@property (nonatomic, assign) BOOL canScroll;
@end

@implementation MDHoverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView = [[MDGestureTableView  alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    self.canScroll = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeScrollStatus) name:@"leaveTop" object:nil];
}

- (void)changeScrollStatus
{
    self.canScroll = YES;
    self.containerCell.objectCanScroll = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView) {
        
        CGFloat bottomCellOffset = [self.tableView rectForSection:1].origin.y - (STATUS_HEIGHT + 44);
        bottomCellOffset = floorf(bottomCellOffset);
        
        if (scrollView.contentOffset.y >= bottomCellOffset) {
            scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
            if (self.canScroll) {
                self.canScroll = NO;
                self.containerCell.objectCanScroll = YES;
            }
        } else {
            //子视图没到顶部
            if (!self.canScroll) {
                scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
            }
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
       return 49;
    }
    return 0;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return self.sliderView;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MDHoverTopCell *hoverTopCell = [tableView dequeueReusableCellWithIdentifier:@"MDHoverTopCell"];
        if (!hoverTopCell) {
            hoverTopCell = [[MDHoverTopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MDHoverTopCell"];
        }
        hoverTopCell.clipsToBounds = YES;
        hoverTopCell.selectionStyle = UITableViewCellSelectionStyleNone;
        hoverTopCell.tag = indexPath.row;
        return hoverTopCell;
    }
    MDHoverContainerCell *contain = [tableView dequeueReusableCellWithIdentifier:@"MDHoverContainerCell"];
    contain = [[MDHoverContainerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MDHoverContainerCell"];
    contain.VC = self;
    self.containerCell = contain;
    contain.delegate = self;
    return contain;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 200.0;
    } else {
        return SCREEN_HEIGHT;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark ——————————FloatContainerCellDelegate——————————

- (void)containerScrollViewDidScroll:(UIScrollView *)scrollView
{
    self.tableView.scrollEnabled = NO;
}

- (void)containerScrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger page = scrollView.contentOffset.x/SCREEN_WIDTH;
    [UIView animateWithDuration:0.2 animations:^{
        [self.sliderView selectSlideBarItemAtIndex:page];
    }];
    self.tableView.scrollEnabled = YES;
}

- (void)viewDidLayoutSubviews
{
    [self.label sizeToFit];
    self.label.top = 0;
    self.label.left = 15;
}

- (FDSlideBar *)sliderView
{
    //滑块部分可任意替换
    if (!_sliderView) {
        NSArray *itemArr = @[@"音乐",@"动态"];
        _sliderView = [[FDSlideBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, sliderHeight)];
        _sliderView.backgroundColor = [UIColor whiteColor];
        _sliderView.itemsWidth = SCREEN_WIDTH / itemArr.count;
        _sliderView.itemsTitle = itemArr;
        _sliderView.itemColor = [UIColor ako_colorWithHexString:@"272829"];
        _sliderView.itemSelectedColor = [UIColor ako_colorWithHexString:@"f2441c"];
        _sliderView.sliderColor = [UIColor ako_colorWithHexString:@"f2441c"];
        [_sliderView slideBarItemSelectedCallback:^(NSUInteger idx) {
            [UIView animateWithDuration:0.5 animations:^{
                self.containerCell.isSelectIndex = YES;
                [self.containerCell.scrollView setContentOffset:CGPointMake(idx*SCREEN_WIDTH, 0) animated:YES];
            }];
        }];
    }
    return _sliderView;
}

@end
