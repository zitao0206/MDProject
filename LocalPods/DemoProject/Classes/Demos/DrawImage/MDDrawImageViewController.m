//
//  MDDrawImageViewController.m
//  MDProject
//
//  Created by Leon0206 on 2017/4/19.
//  Copyright © 2017年 Leon0206. All rights reserved.
//

#import "MDDrawImageViewController.h"
#import <EasyLayout/EasyLayout.h>
#import <QuartzCore/QuartzCore.h>
#import "UGCDrawTextLayer.h"
#import "MDQuartzView.h"
#import "MDDemoTopView.h"
#import <MDPageMaster/MDPageMaster.h>

@interface MDDrawImageViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UGCDrawTextLayer *textLayer;
@property (nonatomic, strong) MDQuartzView *textView;
@property (nonatomic, strong) MDDemoTopView *topView;
@property (nonatomic, copy) NSString *stringTemp;

@end

@implementation MDDrawImageViewController

- (void)handleWithURLAction:(MDUrlAction *)urlAction
{
    self.image = [urlAction anyObjectForKey:@"image"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.bgView = [UIView new];
    self.bgView.width = 300;
    self.bgView.height = 200;
    self.label = [[UILabel alloc]initWithFrame:CGRectZero];
    self.label.font = [UIFont systemFontOfSize:9];
    self.label.width = 100;
    self.label.numberOfLines = 0;
    self.label.backgroundColor = [UIColor greenColor];
    self.stringTemp = @"中山公园世纪大道人民公园浦东大道";
    NSAttributedString * aS = [self obtainStrWith:self.stringTemp And:18];
    self.label.attributedText = aS;
    
//    NSDictionary *dic = [self obtainAttributesWith:aS];
    
    [self.view addSubview:self.label];
    self.view.backgroundColor = [UIColor whiteColor];

}

- (NSDictionary<NSString *, id> *)obtainAttributesWith:(NSAttributedString *)s
{
    NSRange range = NSMakeRange(0, s.length);
    NSDictionary *dic = [s attributesAtIndex:0 effectiveRange:&range];
    return dic;
}

-(NSString*)dicTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}


- (NSAttributedString *)obtainStrWith:(NSString *)str And:(CGFloat)font
{
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing = 15;
    return [[NSAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font],NSParagraphStyleAttributeName:style}];
}

- (UGCDrawTextLayer *)obtainStrWithTitle:(NSString *)str And:(UIFont *)font
{
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing = 5;
    return [[UGCDrawTextLayer alloc] initWithText:[[NSAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName : font, NSForegroundColorAttributeName: [UIColor blackColor],NSParagraphStyleAttributeName:style}]];
}

- (CGSize)obtainSize:(NSString *)str
{
    CGSize suggestSize = [str boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size;
    return suggestSize;
}

+ (UIImage *)imageWithView:(UIView *)v
{
    CGSize s = v.bounds.size;
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (NSAttributedString *)obtainStrWith:(NSString *)str
{
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing = 1;
    return [[NSAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20], NSForegroundColorAttributeName: [UIColor yellowColor],NSParagraphStyleAttributeName:style}];
}



- (void)viewDidLayoutSubviews
{
    [self.label sizeToFit];
    self.label.top = 100;
    self.label.left = 15;
}

@end
