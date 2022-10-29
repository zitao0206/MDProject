//
//  XYMiddleModuleView.m
//  XYReactivePageKit
//
//  Created by Leon0206 on 2018/2/1.
//

#import "XYMiddleModuleView.h"
@implementation XYMiddleModuleView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self performSelector:@selector(test) withObject:self afterDelay:3.f];
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

- (void)test
{
    self.height = self.height + 30;
}

@end
