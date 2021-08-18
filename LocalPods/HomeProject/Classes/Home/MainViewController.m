//
//  MainViewController.m
//  MDProject
//
//  Created by Leon0206 on 17/3/12.
//  Copyright © 2017年 Leon0206. All rights reserved.
//

#import "MainViewController.h"
#import <MDPageMaster/MDPageMaster.h>
#import <MDCommonKit/MDCommonKit.h>
#import "AppDelegate.h"
#import "MainCollectionViewCell.h"
#import <SwiftDemoProject/SwiftDemoProject-Swift.h>

@interface MainViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray <NSString *> *titleArr;
@property (nonatomic, strong) NSMutableArray <MDUrlAction *> *actionArr;

@property (nonatomic, strong) NSMutableArray *mutableArray;

@end

@implementation MainViewController

+ (BOOL)isSingleton
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self loadTitleArray];
    [self loadActionArray];

}

- (void)loadTitleArray
{
    self.titleArr = [NSMutableArray new];
    NSArray *array = @[
        @"Swift实例",  //29
        @"模块化框架进阶2",  //28
        @"模块化框架进阶1",  //27
        @"WeakInstance",                  //26
        @"MultiRoleView",                  //25
        @"HoverView",                     //24
        @"AFNetworking",                     //23
        @"WebView",                          //22
        @"MDFelix",                          //21
        @"CATransition",                     //20
        @"Window",                           //19
        @"SDWebImage",                       //18
        @"StateMaching",                     //17
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
    {//29
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://swiftdemo"]];
        [self.actionArr addObject:action];
    }
    {//28
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://hallViewModule"]];
        [self.actionArr addObject:action];
    }
    {//27
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://hallModule"]];
        [self.actionArr addObject:action];
    }
    {//26
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://weakInstance"]];
        [self.actionArr addObject:action];
    }
    {//25
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://multirole"]];
        [self.actionArr addObject:action];
    }
    {//24
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://hover"]];
        [self.actionArr addObject:action];
    }
    {//23
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://afn"]];
        [self.actionArr addObject:action];
    }
    {//22
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://webview"]];
        [self.actionArr addObject:action];
    }
    {//21
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://hotfix"]];
        [self.actionArr addObject:action];
    }
    {//20
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://transition"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//19
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://window"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//18
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://SDWebImage"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//17
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://stateMaching"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//16
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://zipArchive"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//15
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://jspatch"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//14
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://cache"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//13
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://reactivePage_3"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//12
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://reactivePage_2"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//11
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://reactivePage"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//10
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://invoker"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//9
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdruntime2"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//8
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdruntime1"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    
    {//7
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdfilter"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//6
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdfacefeatures"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//5
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdquartzdraw"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//4
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdmultithread"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//3
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdjson"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//2
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mddrawimage"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//1
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://mdbasemodule"]];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
    {//0
        MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://rac"]];
        [action setString:@"http://www.baidu.com" forKey:@"url"];
        action.animation = MDNaviAnimationPush;
        [self.actionArr addObject:action];
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titleArr.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((kScreenWidth - 10 * 3) / 2.0, 50);
}

//footer的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}

//header的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}

//每个section的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

//每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

//cell显示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainCollectionViewCell *contentCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MainCollectionViewCell" forIndexPath:indexPath];
    [contentCell refreshData:[self.titleArr objectAtIndex:indexPath.row]];
    return contentCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MDUrlAction *action = [self.actionArr objectAtIndex:indexPath.row];
    if (action == nil) return;
    [[MDPageMaster master] openURLAction:action];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:layout];
        _collectionView.backgroundColor = [[UIColor brownColor]colorWithAlphaComponent:0.2];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[MainCollectionViewCell class] forCellWithReuseIdentifier:@"MainCollectionViewCell"];
        _collectionView.showsVerticalScrollIndicator = YES;
        _collectionView.showsHorizontalScrollIndicator = YES;
    }
    return _collectionView;
}

@end
