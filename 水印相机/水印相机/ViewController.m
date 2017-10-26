//
//  ViewController.m
//  水印相机
//
//  Created by xyj on 2017/10/25.
//  Copyright © 2017年 xyj. All rights reserved.
//
#import "ZHWaterMarkCamera.h"
#import "ViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController
- (IBAction)makeCameraAction:(id)sender {
    ZHWaterMarkCamera *cameraVC = [ZHWaterMarkCamera makeWaterMarkCameraWithUserName:@"小王" andCompletedBlock:^(UIImage *image) {
         self.imageView.image = image;
    }];
    [self presentViewController:cameraVC animated:YES completion:nil];
}

@end
