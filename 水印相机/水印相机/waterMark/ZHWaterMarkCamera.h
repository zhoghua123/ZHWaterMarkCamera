//
//  ZHWaterMarkCamera.h
//  水印相机
//
//  Created by xyj on 2017/10/25.
//  Copyright © 2017年 xyj. All rights reserved.
//

/*
 使用配置
 1. info.plist需要配置
 NSPhotoLibraryUsageDescription
 访问相册，是否允许
 NSCameraUsageDescription
 访问相机，是否允许
 NSLocationWhenInUseUsageDescription
 获取地理位置
 NSLocationAlwaysUsageDescription(ios10)
 NSLocationAlwaysAndWhenInUsageDescription(ios11)
 获取地理位置
 2.将图片资源拖进Assets即可
 **/
#import <UIKit/UIKit.h>

@interface ZHWaterMarkCamera : UIViewController
//初始化方法
+(instancetype)makeWaterMarkCameraWithUserName:(NSString *)userName andCompletedBlock:(void(^)(UIImage *image))complete;
/** 是否需要12小时制处理，default is NO */
@property (nonatomic, assign) BOOL isTwelveHandle;
@end
