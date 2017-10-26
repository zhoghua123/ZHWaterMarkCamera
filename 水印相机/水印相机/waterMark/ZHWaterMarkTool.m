//
//  ZHWaterMarkTool.m
//  水印相机
//
//  Created by xyj on 2017/10/25.
//  Copyright © 2017年 xyj. All rights reserved.
//

#import "ZHWaterMarkTool.h"

@implementation ZHWaterMarkTool
+(NSString *)weekdayStringFromDate:(NSDate *)inputDate{
    if (!inputDate) {
        inputDate = [NSDate date];
    }
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
}
+(NSString *)dateStingWithFormatterSting:(NSString *)formatterStr andInputDate:(NSDate *)inputDate{
    if (!inputDate) {
        inputDate = [NSDate date];
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterStr];
    return [formatter stringFromDate:inputDate];
}
//获取系统是24小时制或者12小时制
+(BOOL)isTwelveMechanism {
    NSString *formatStringForHours = [NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:[NSLocale currentLocale]];
    NSRange containsARange = [formatStringForHours rangeOfString:@"a"];
    BOOL isTwelveMechanism = containsARange.location != NSNotFound;
    /** isTwelveMechanism = YES 12小时制，否则是24小时制 */
    return isTwelveMechanism;
}
//判断当前时间是上午还是下午
+(int)currentIntTime {
    NSDateFormatter *formatter0 = [[NSDateFormatter alloc]init];
    [formatter0 setDateFormat:@"HH"];
    NSString *str = [formatter0 stringFromDate:[NSDate date]];
    int time = [str intValue];
    return time;
}
/**
 *  创建View
 */
+(UIView *)viewWithFrame:(CGRect)frame WithSuperView:(UIView *)superView{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor blackColor];
    [superView addSubview:view];
    return view;
}
/**
 *  创建ImageView
 */
+(UIImageView *)imageViewWithImageName:(NSString *)imageName superView:(UIView *)superView frame:(CGRect)frame {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    [superView addSubview:imageView];
    return imageView;
}

/**
 *  创建button
 */
+(UIButton *)buttonWithTitle:(NSString *)title imageName:(NSString *)imageName target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    UIImage *image = [UIImage imageNamed:imageName];
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
/**
 *  创建label
 */
+(UILabel *)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.text = text;
    label.textAlignment = alignment;
    label.backgroundColor = [UIColor clearColor];
    return label;
}
//给出行高,字符串,计算字符串宽度
+ (CGFloat)calculateRowWidth:(NSString *)string fontSize:(CGFloat)fontSize fontHeight:(CGFloat) fontHeight{
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};  //指定字号
    CGRect rect = [string boundingRectWithSize:CGSizeMake(0, fontHeight)/*计算宽度时要确定高度*/ options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.width;
}

@end
