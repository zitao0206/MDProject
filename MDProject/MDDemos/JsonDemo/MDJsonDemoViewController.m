//
//  MDJsonDemoViewController.m
//  MDProject
//
//  Created by lizitao on 2017/6/7.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDJsonDemoViewController.h"
#import "MDJsonLabelModel.h"
#import "UIColor+nvutils.h"
#import "UIView+ResizeFrame.h"

@interface MDJsonDemoViewController ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation MDJsonDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.label = [UILabel new];
    self.label.numberOfLines = 0;
    [self.view addSubview:self.label];
    NSString *jsonstring = @"{\"backgroundColor\":\"#ff631e\",\"lineSpacing\":40,\"textList\":[{\"text\":\"这是一个支持双引号的控件\",\"textSize\":16,\"textColor\":\"#ff631e\"},{\"text\":\"这是一个支持双引号的控件\",\"textSize\":12,\"textColor\":\"#22631e\"}]}";
//    NSDictionary *dict = @{@"name":@"Mitchell",@"age":@10,@"sex":@"man",@"ID":@"aaa"};
    NSDictionary *dic = [self JSONValue:jsonstring];
    MDJsonLabelModel *model = [MTLJSONAdapter modelOfClass:[MDJsonLabelModel class] fromJSONDictionary:dic error:nil];
    model.textList = [MTLJSONAdapter modelsOfClass:[MDJsonLabelContentModel class] fromJSONArray:model.textList error:nil];
    
    self.label.attributedText = [self.class getContentStringWithModel:model];
 
     self.label.width = 100;
    [self.label sizeToFit];
   
}

+ (NSMutableAttributedString *)getContentStringWithModel:(MDJsonLabelModel *)model
{
    NSMutableAttributedString *allAttributedString = [[NSMutableAttributedString alloc] init];
    if (!model) return allAttributedString;
    
    for (MDJsonLabelContentModel *textModel in model.textList) {
        if (textModel.text.length > 0) {
            NSMutableAttributedString *fragmentAttributedString = [[NSMutableAttributedString alloc] initWithString:textModel.text];
            UIFont *jsonFont = [self getFontWithModel:textModel];
            if (jsonFont) {
                [fragmentAttributedString addAttribute:NSFontAttributeName value:jsonFont range:NSMakeRange(0, textModel.text.length)];
            }
            //字体颜色
            if (textModel.textColor.length > 0) {
                UIColor *textColor = [UIColor nvColorWithHexString:textModel.textColor];
                if (textColor) {
                    [fragmentAttributedString addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0, textModel.text.length)];
                }
            };
            
            [allAttributedString appendAttributedString:fragmentAttributedString];
        }
    }
    
    return allAttributedString;
}

+ (UIFont *)getFontWithModel:(MDJsonLabelContentModel *)model
{
    UIFont *currentFont = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    //字体大小
    CGFloat fontSize = model.textSize.floatValue;
    if (fabs(fontSize - 0) <= 0.5) {
        fontSize = currentFont.pointSize;
    }
    UIFont *jsonFont = [UIFont fontWithName:currentFont.fontName size:fontSize];
    return jsonFont;
}


- (NSString *)JSONRepresentation
{
    if (![NSJSONSerialization isValidJSONObject:self]) return @"{}";
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONReadingAllowFragments | NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"%@", error);
    }
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (id)JSONValue:(NSString *)s
{
    if (s.length == 0) return @{};
    NSError *error = nil;
    id obj = [NSJSONSerialization JSONObjectWithData:[s dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&error];
    if (error)
    {
        NSLog(@"%@", error);
        return nil;
    }
    return obj;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.label.top = 100;
    self.label.left = 15;
}

@end
