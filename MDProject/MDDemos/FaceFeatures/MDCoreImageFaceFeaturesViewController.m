//
//  MDCoreImageFaceFeaturesViewController.m
//  MDProject
//
//  Created by lizitao on 2017/7/27.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDCoreImageFaceFeaturesViewController.h"
#import "UIView+ResizeFrame.h"

@interface MDCoreImageFaceFeaturesViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic, strong) UIImageView *inputImageView;
@property (nonatomic, strong) UIImageView *outputImageView;
@property (nonatomic, strong) UIButton *selectBtn;
@property (nonatomic, strong) UIButton *detectBtn;

@end

@implementation MDCoreImageFaceFeaturesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ugcup" ofType:@"png"];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:imagePath];
    self.inputImageView  = [[UIImageView alloc] initWithImage:image];
    self.inputImageView.width = self.view.width - 30;
    self.inputImageView.height = self.inputImageView.width * 2 / 3;
    [self.view addSubview:self.inputImageView];
    
    self.selectBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.selectBtn setTitle:@"选择图片" forState:UIControlStateNormal];
    [self.selectBtn addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
    self.selectBtn.height = 30;
    self.selectBtn.width = self.view.width - 60;
    self.selectBtn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.selectBtn];
    
    self.detectBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.detectBtn setTitle:@"开始识别" forState:UIControlStateNormal];
    [self.detectBtn addTarget:self action:@selector(faceDetector) forControlEvents:UIControlEventTouchUpInside];
    self.detectBtn.height = 30;
    self.detectBtn.width = self.view.width - 60;
    self.detectBtn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.detectBtn];
    
    self.outputImageView  = [[UIImageView alloc] init];
    self.outputImageView.width = self.view.width - 30;
    self.outputImageView.height = self.outputImageView.width * 2 / 3;
    [self.view addSubview:self.outputImageView];
}

//人脸识别
- (void)faceDetector
{
    CIContext *context = [CIContext contextWithOptions:nil];
    UIImage *imageInput = self.inputImageView.image;
    CIImage *image = [CIImage imageWithCGImage:imageInput.CGImage];
    //设置识别参数
    NSDictionary *param = [NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh forKey:CIDetectorAccuracy];
    CIDetector *faceDetector = [CIDetector detectorOfType:CIDetectorTypeFace context:context options:param];
    NSArray *detectResult = [faceDetector featuresInImage:image];
    UIView *resultView = [[UIView alloc]initWithFrame:self.inputImageView.frame];
    [self.view addSubview:resultView];
    
    for (CIFaceFeature *faceFeature in detectResult) {
        //脸部
        UIView *faceView = [[UIView alloc]initWithFrame:faceFeature.bounds];
        faceView.layer.borderWidth = 1;
        faceView.layer.borderColor =[UIColor orangeColor].CGColor;
        [resultView addSubview:faceView];
        
        //左眼
        if (faceFeature.hasLeftEyePosition) {
            UIView *leftEyeView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, 5)];
            [leftEyeView setCenter:faceFeature.leftEyePosition];
            leftEyeView.layer.borderWidth = 1;
            leftEyeView.layer.borderColor = [UIColor redColor].CGColor;
            [resultView addSubview:leftEyeView];
        }
        //右眼
        if (faceFeature.hasRightEyePosition) {
            UIView *rightEyeView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, 5)];
            [rightEyeView setCenter:faceFeature.rightEyePosition];
            rightEyeView.layer.borderWidth = 1;
            rightEyeView.layer.borderColor = [UIColor redColor].CGColor;
            [resultView addSubview:rightEyeView];
        }
        //嘴巴
        if (faceFeature.hasMouthPosition) {
            UIView *mouthView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, 5)];
            [mouthView setCenter:faceFeature.mouthPosition];
            mouthView.layer.borderWidth = 1;
            mouthView.layer.borderColor = [UIColor redColor].CGColor;
            [resultView addSubview:mouthView];
        }
    }
    [resultView setTransform:CGAffineTransformMakeScale(1, -1)];
    if ([detectResult count] > 0) {
        CIImage *faceImage = [image imageByCroppingToRect:[[detectResult objectAtIndex:0] bounds]];
        UIImage *face = [UIImage imageWithCGImage:[context createCGImage:faceImage fromRect:faceImage.extent]];
        self.outputImageView.image = face;
        NSString *s = [NSString stringWithFormat:@"识别人脸数：%ld",detectResult.count];
        [self.detectBtn setTitle:s forState:UIControlStateNormal];
        
    }
}

//文字识别
- (void)textDetector
{
    CIContext *context = [CIContext contextWithOptions:nil];
    UIImage *imageInput = self.inputImageView.image;
    CIImage *image = [CIImage imageWithCGImage:imageInput.CGImage];
    //设置识别参数
    NSDictionary *param = [NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh forKey:CIDetectorAccuracy];
    CIDetector *faceDetector = [CIDetector detectorOfType:CIDetectorTypeText context:context options:param];
    NSArray *detectResult = [faceDetector featuresInImage:image];
    UIView *resultView = [[UIView alloc]initWithFrame:self.inputImageView.frame];
    [self.view addSubview:resultView];
    
    if ([detectResult count] > 0) {
        
    }
}

- (void)select:(id)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择图像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"手机相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
         [self photoSourceWith:UIImagePickerControllerSourceTypePhotoLibrary];
    }];
    [alertController addAction:okAction];
    [self.parentViewController presentViewController:alertController animated:YES completion:nil];
}

- (void)photoSourceWith:(UIImagePickerControllerSourceType)type
{
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    //设置选取的照片是否可编辑
    pickerController.allowsEditing = NO;
    //设置相册呈现的样式
    pickerController.sourceType = type;//图片分组列表样式
    pickerController.delegate = self;
    //使用模态呈现相册
    [self.navigationController presentViewController:pickerController animated:YES completion:^{
        
    }];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *resultImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.inputImageView.image = resultImage;
    });
    //使用模态返回到软件界面
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.inputImageView.left = 15;
    self.inputImageView.top = 75;
    
    self.selectBtn.top = self.inputImageView.bottom + 30;
    self.selectBtn.centerX = self.view.centerX;
    
    self.detectBtn.top = self.selectBtn.bottom + 10;
    self.detectBtn.centerX = self.view.centerX;
    
    self.outputImageView.left = 15;
    self.outputImageView.top = self.detectBtn.bottom + 30;
}

@end
