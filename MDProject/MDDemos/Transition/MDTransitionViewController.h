//
//  MDTransitionViewController.h
//  MDProject
//
//  Created by lizitao on 2018/12/6.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDTransitionViewController : UIViewController
@property (nonatomic, strong) UICollectionView *collectionView;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (assign, nonatomic) CGRect finiRect;

@end

