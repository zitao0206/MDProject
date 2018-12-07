//
//  MDBaseFromViewController.h
//  MDProject
//
//  Created by lizitao on 2018/12/7.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDBaseFromViewController : UIViewController
//默认是collectionView
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, assign) CGRect finiRect;
@end

