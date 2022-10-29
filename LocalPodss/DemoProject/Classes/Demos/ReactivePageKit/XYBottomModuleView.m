//
//  XYBottomModuleView.m
//  XYReactivePageKit
//
//  Created by Leon0206 on 2018/2/1.
//

#import "XYBottomModuleView.h"

@implementation XYBottomModuleView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor greenColor];
        
    }
    return self;
}

- (void)loadModuleViewData:(id)data
{
    //子类重写
}

- (void)layoutModuleViewWithWidth:(CGFloat)width
{
    //子类重写
    self.frame = CGRectMake(0, 0, width, 100.0);
}

@end
