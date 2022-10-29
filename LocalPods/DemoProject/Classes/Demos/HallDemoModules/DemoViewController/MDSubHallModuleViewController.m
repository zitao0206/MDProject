//
//  MDSubHallModuleViewController.m
//  MDProject
//
//  Created by Leon0206 on 2018/4/15.
//

#import "MDSubHallModuleViewController.h"
#import <MDCommonKit/MDCommonKit.h>

@interface MDSubHallModuleViewController()

@end

@implementation MDSubHallModuleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.model = [NSObject new];
}
 
- (NSArray *)cellModules
{
    CGFloat width = (self.view.width - 10 * 2);
    return @[
        @[@"MainSubTopCollectionViewCellModule", ModuleSize(width, 60)],
//        @[@"MDBaseSpaceCellModule", ModuleLayout(width, 5)],
        @[@"MainSubMiddleCollectionViewCellModule", ModuleSize(width, 60)],
//        @[@"MDBaseSpaceCellModule", ModuleLayout(width, 5)],
        @[@"MainSubBottomCollectionViewCellModule", ModuleSize(width, 60)],
//        @[@"MDBaseSpaceCellModule", ModuleLayout(width, 5)],
        @[@"MainSubTopCollectionViewCellModule", ModuleSize(width, 60)],
        @[@"MainSubBottomCollectionViewCellModule", ModuleSize(width, 60)],
        @[@"MainSubBottomCollectionViewCellModule", ModuleSize(width, 60)],
        @[@"MainSubBottomCollectionViewCellModule", ModuleSize(width, 60)],
        @[@"MainSubBottomCollectionViewCellModule", ModuleSize(width, 60)],
        @[@"MainSubBottomCollectionViewCellModule", ModuleSize(width, 60)],
        @[@"MainSubBottomCollectionViewCellModule", ModuleSize(width, 60)],
        @[@"MainSubBottomCollectionViewCellModule", ModuleSize(width, 60)],
        @[@"MainSubBottomCollectionViewCellModule", ModuleSize(width, 60)],
        @[@"MainSubTopCollectionViewCellModule", ModuleSize(width, 60)],
        @[@"MainSubTopCollectionViewCellModule", ModuleSize(width, 60)],
        @[@"MainSubTopCollectionViewCellModule", ModuleSize(width, 60)],
        @[@"MainSubTopCollectionViewCellModule", ModuleSize(width, 60)],
        @[@"MainSubTopCollectionViewCellModule", ModuleSize(width, 60)],
        
    ];
}

- (UIEdgeInsets)contentViewEdgeInsets
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGFloat)minimumInteritemSpacing
{
    return 0.0;
}

- (CGFloat)minimumLineSpacing
{
    return 5.0;
}

@end
