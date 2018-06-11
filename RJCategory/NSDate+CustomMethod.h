//
//  NSDate+CustomMethod.h
//  Signature
//
//  Created by 任敬 on 2018/3/28.
//  Copyright © 2018年 任敬. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (CustomMethod)

/**
 str -> date

 @param str yyyy-MM-dd HH:mm:ss
 @return date
 */
+ (NSDate *)dateFromTimeString:(NSString *)str;

/**
 date -> str

 @param date date
 @return yyyy-MM-dd HH:mm:ss
 */
+ (NSString *)timeStringFromDate:(NSDate *)date;

/**
 date -> str
 
 @param date date
 @return yyyy-MM-dd 
 */
+ (NSString *)timeStringYMDFromDate:(NSDate *)date;

//和当前时间比较返回对应格式
+ (NSString*)compareTime:(NSString *)time;

@end
