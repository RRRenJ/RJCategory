//
//  NSString+CustomMethod.h
//  RRRCustom
//
//  Created by 任敬 on 2018/5/23.
//  Copyright © 2018年 任敬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (CustomMethod)

#pragma - mark - StringAboutNull
/**
 判断是否为空

 @return 空返回YES
 */
- (BOOL)isNull;

/**
 如果是空返回0

 @return 0 or self
 */

- (NSString *)nullConvertIntoZero;
/**
 如果是空返回空格
 
 @return 空格 or self
 */
- (NSString *)nullConvertIntoSpace;
/**
 如果是空返回“”
 
 @return “” or self
 */
- (NSString *)nullConvertIntoNothing;

#pragma - mark - ValidateFormat
/**
 验证中国区电话号码格式

 @return YES or NO
 */
- (BOOL)isValidatePhoneNumber;
/**
验证6-16位数字和字母以及~@#$%^&*()的混合密码
 
 @return YES or NO
 */
- (BOOL)isValidatePassword;
/**
 验证6-16位密码
 
 @return YES or NO
 */
- (BOOL)isValidateJustLongPassword;

/**
 验证是否是整数

 @return YES or NO
 */
- (BOOL)isValidateJustInteger;
/**
 验证是否是浮点数
 
 @return YES or NO
 */
- (BOOL)isPureFloat;


/**
 验证字符串金额格式

 @return 是否为金额格式  最多两位小数
 */
-(BOOL)validateMoney;


/**
 验证输入框金额格式

 @return 输入框text是否为金额格式，最多两位小数,整数最多10位金额,大于1元开头不能为零.
 */
- (BOOL)validateTextFieldMoney;

/**
 计算文件大小

 @return KB，MB，GB
 */
- (NSString *)fileSize;

/**
 计算文件大小

 @return 字节
 */
- (NSInteger)fileSizeWithInteger;

/**
 计算文字高度

 @param width 给定宽
 @param font 字体
 @return 高度
 */
- (float)getHeightByWidth:(float)width font:(UIFont*)font;
/**
 计算文字宽度
 
 @param height 给定高
 @param font 字体
 @return 高度
 */
- (float)getWidthByHeight:(float)height font:(UIFont*)font;

@end
