//
//  ZHWaterMarkTool.h
//  水印相机
//
//  Created by xyj on 2017/10/25.
//  Copyright © 2017年 xyj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHWaterMarkTool : NSObject

/**
 根据输入的日期判断出当时是星期几
 @param inputDate 输入日期 如果为nil,默认为当前NSDate
 @return 返回星期几
 */
+(NSString *)weekdayStringFromDate:(NSDate*)inputDate;

/**
 返回时间字符串
 @param formatterStr 时间字符串格式
 @param inputDate 日期(nil为当前日期)
 @return 字符串类型的日期
 */
+(NSString *)dateStingWithFormatterSting:(NSString *)formatterStr andInputDate:(NSDate *)inputDate;
//获取系统是24小时制或者12小时制
+(BOOL)isTwelveMechanism;


/**
 根据小时判断是上午还是下午
 
 @return >12下午,反之上午
 */
+(int)currentIntTime;

/**
 计算字符串的宽度

 @param string 要计算的字符串
 
 @param fontSize 字体大小
 @param fontHeight 行高
 @return 返回宽度
 */
+ (CGFloat)calculateRowWidth:(NSString *)string fontSize:(CGFloat)fontSize fontHeight:(CGFloat) fontHeight;
//创建label
/**
 创建字体白色,背景透明的Label

 @param text 输入的文字
 @param fontSize 字体大小
 @param alignment 排列
 @return 返回label
 */
+ (UILabel *)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment;
/**
 *  创建button
 */
+ (UIButton *)buttonWithTitle:(NSString *)title imageName:(NSString *)imageName target:(id)target action:(SEL)action;
/**
 *  创建并添加ImageView
 */
+ (UIImageView *)imageViewWithImageName:(NSString *)imageName superView:(UIView *)superView frame:(CGRect)frame ;
//添加View
+ (UIView *)viewWithFrame:(CGRect)frame WithSuperView:(UIView *)superView;
@end
