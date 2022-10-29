//
//  MDJsonImageViewModel.h
//  MDProject
//
//  Created by Leon0206 on 2017/6/15.
//  Copyright © 2017年 Leon0206. All rights reserved.
//

#import "MDJsonModel.h"

@interface MDJsonImageViewModel : MDJsonModel
/**url*/
@property(nonatomic, copy) NSString *url;
/**本地图片*/
@property(nonatomic, copy) NSString *localImageName;

@end
