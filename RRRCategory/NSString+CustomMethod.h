//
//  NSString+CustomMethod.h
//  RRRCustom
//
//  Created by 任敬 on 2018/5/23.
//  Copyright © 2018年 任敬. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@end
