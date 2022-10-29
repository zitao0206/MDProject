//
//  MDFromViewController.m
//  MDProject
//
//  Created by Leon0206 on 2018/12/6.
//  Copyright © 2018年 Leon0206. All rights reserved.
//

#import "MDFromViewController.h"
#import <MDPageMaster/MDPageMaster.h>
#import "MDFromViewControllerForwardTransition.h"
#import "MDToViewController.h"

#define  CellWidth   self.view.frame.size.width/4
#define  CellHeight  self.view.frame.size.width/4

@interface MDFromViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@end

@implementation MDFromViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initCollectionView];
}



- (void)initCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //设置CollectionView的属性
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.scrollEnabled = YES;
    [self.view addSubview:self.collectionView];
    //注册Cell
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row > 10) {
         return  CGSizeMake(CellWidth + 20, CellHeight);
    } else {
        return  CGSizeMake(CellWidth, CellHeight + 20);
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row > 10) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"desktop.png"]];
        imageView.frame = CGRectMake(0, 0, CellWidth + 20, CellHeight);
        [cell addSubview:imageView];
    } else {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"launch.jpg"]];
        imageView.frame = CGRectMake(0, 0, CellWidth, CellHeight + 20);
        [cell addSubview:imageView];
    }

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MDUrlAction *action = [MDUrlAction actionWithURL:[NSURL URLWithString:@"mydemo://trandetail"]];
    if (indexPath.row > 10) {
        [action setAnyObject:[UIImage imageNamed:@"desktop.png"] forKey:@"image"];
    } else {
        [action setAnyObject:[UIImage imageNamed:@"launch.jpg"] forKey:@"image"];
    }
    if (action == nil) return;
    [[MDPageMaster master] openURLAction:action];

}

@end
