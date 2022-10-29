//
//  MDHoverContainerCell.m
//  MDProject
//
//  Created by Leon0206 on 2018/2/22.
//  Copyright © 2018年 Leon0206. All rights reserved.
//

#import "MDHoverContainerCell.h"
#import <EasyLayout/EasyLayout.h>
#import "FirstTableViewController.h"
#import "SecondTableViewController.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_WINDOW_HEIGHT (SCREEN_HEIGHT-(STATUS_HEIGHT+44))
#define STATUS_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height//状态栏高度
#define sliderHeight 49

@interface MDHoverContainerCell ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) FirstTableViewController *firstVC;
@property (nonatomic, strong) SecondTableViewController *secondVC;

@end

@implementation MDHoverContainerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.scrollView];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setVC:(UIViewController *)VC
{
    _VC = VC;
    [self configScrollView];
}

- (void)configScrollView
{
    _firstVC = [FirstTableViewController new];
    _firstVC.VC = _VC;
    _secondVC = [SecondTableViewController new];
    _secondVC.VC = _VC;
    
    [self.scrollView addSubview:_firstVC.view];
    [self.scrollView addSubview:_secondVC.view];
    
    _firstVC.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WINDOW_HEIGHT-sliderHeight);
    _secondVC.view.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_WINDOW_HEIGHT-sliderHeight);
}

 

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.isSelectIndex = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 为了横向滑动的时候，外层的tableView不动
    if (!self.isSelectIndex) {
        if (scrollView == self.scrollView) {
            if ([self.delegate respondsToSelector:@selector(containerScrollViewDidScroll:)]) {
                [self.delegate containerScrollViewDidScroll:scrollView];
            }
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == self.scrollView) {
        if ([self.delegate respondsToSelector:@selector(containerScrollViewDidEndDecelerating:)]) {
            [self.delegate containerScrollViewDidEndDecelerating:scrollView];
        }
    }
}

- (void)setObjectCanScroll:(BOOL)objectCanScroll
{
    _objectCanScroll = objectCanScroll;
    
    self.firstVC.vcCanScroll = objectCanScroll;
    self.secondVC.vcCanScroll = objectCanScroll;
    
    if (!objectCanScroll) {
        [self.firstVC.tableView setContentOffset:CGPointZero animated:NO];
        [self.secondVC.tableView setContentOffset:CGPointZero animated:NO];
        
    }
}


- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WINDOW_HEIGHT-sliderHeight)];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * 2, _scrollView.frame.size.height);
    }
    return _scrollView;
}


@end
