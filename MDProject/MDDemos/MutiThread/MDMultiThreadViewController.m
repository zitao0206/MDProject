//
//  MDMultiThreadViewController.m
//  MDProject
//
//  Created by lizitao on 2017/6/28.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDMultiThreadViewController.h"
#import "UIColor+nvutils.h"

@interface MDMultiThreadViewController ()
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic,strong) NSString  *strongStr;
@property (nonatomic, copy  )NSString  *copyssStr;


@property (nonatomic, copy) NSMutableString *mString;
@property (nonatomic, assign) NSTimer *timer;

@end

@implementation MDMultiThreadViewController

- (void)dealloc
{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableString *mStr = [NSMutableString stringWithFormat:@"abc"];
    
    NSString *string = [NSString stringWithFormat:@"测试文字"];//注释1
    self.strongStr = string;
    self.copyssStr = string;
    
    NSLog(@"测试文字   String: %p, %p", string, &string);
    NSLog(@"Strong属性 String: %p, %p",_strongStr, &_strongStr);
    NSLog(@"Copy  属性 String: %p, %p",_copyssStr, &_copyssStr);
    
    
    self.strongStr = mStr;
    self.copyssStr = mStr;
    
    NSLog(@"测试文字   String: %p, %p", mStr, &mStr);
    NSLog(@"Strong属性 String: %p, %p",_strongStr, &_strongStr);
    NSLog(@"Copy  属性 String: %p, %p",_copyssStr, &_copyssStr);
    
    
    _mString = [NSMutableString new];
    _mString = [mStr mutableCopy];
    [_mString appendString:@"123"];
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(15, 100, 200, 200)];
    
    view.backgroundColor = [UIColor nvColorWithHexString:@"ffffff"];
    view.layer.shadowColor = [UIColor nvColorWithHexString:@"33000000"].CGColor;
    view.layer.shadowOpacity = 0.8;
    view.layer.shadowOffset = CGSizeMake(0, 3);
    view.layer.shadowRadius = 6;
    
    self.imageView = [UIImageView new];
    
    self.imageView.clipsToBounds = YES;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.image = [UIImage imageNamed:@"ugcup.png"];

    [view addSubview:self.imageView];
    self.view.backgroundColor = [UIColor nvColorWithHexString:@"f0f0f0"];
    [self.view addSubview:view];

    dispatch_queue_t queue = dispatch_queue_create("com.dispatch.serial", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        [self testDataFormatter];
        NSLog(@"%@",self.copyssStr);
    });
    [self download];
    
    [self timerFire];
}

- (void)timerFire
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0f
                                                  target:self
                                                selector:@selector(testDataFormatter)
                                                userInfo:nil
                                                 repeats:NO];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidAppear:YES];
    NSTimer *tttime = self.timer;
    [tttime invalidate];
    self.timer = nil;
    tttime = nil;
}

- (void)testDataFormatter
{
    for (NSUInteger i = 0; i < 1; i++) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
        NSLog(@"%@",currentDateStr);
    }
    
    NSLog(@"finished...");
}

- (void)download
{
    // 在子线程下载图片
    NSURL *url = [NSURL URLWithString:@"http://b.hiphotos.baidu.com/image/pic/item/e4dde71190ef76c666af095f9e16fdfaaf516741.jpg"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    // 设置图片，执行self.imageView的setImage:方法
    //    [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:YES];
    
    // 另一张设置图片的方法
    // 回到主线程中执行 showImage:方法，在此方法中设置图片
    [self performSelector:@selector(showImage:) onThread:[NSThread mainThread] withObject:image waitUntilDone:YES];
 
}

-(void)showImage:(UIImage *)image
{
    // 更新UI
    self.imageView.image = image;
}

- (void)viewDidLayoutSubviews
{
    self.imageView.frame = CGRectMake(0, 0, 200, 200);
}

@end
