//
//  MDBaseFromViewController.h
//  MDProject
//
//  Created by Leon0206 on 2018/12/7.
//  Copyright © 2018年 Leon0206. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDBaseFromViewController : UIViewController
@property (nonatomic, strong) UICollectionView *collectionView;//默认是collectionView
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, assign) CGRect finiRect;
@end

