//
//  XYTopModuleView.m
//  XYReactivePageKit
//
//  Created by lizitao on 2018/2/1.
//

#import "XYTopModuleView.h"
#import "UIView+ResizeFrame.h"
@implementation XYTopModuleView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor redColor];
        
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
