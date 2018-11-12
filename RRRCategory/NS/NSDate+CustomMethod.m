//
//  NSDate+CustomMethod.m
//  Signature
//
//  Created by 任敬 on 2018/3/28.
//  Copyright © 2018年 任敬. All rights reserved.
//

#import "NSDate+CustomMethod.h"

@implementation NSDate (CustomMethod)

+ (NSDate *)dateFromTimeString:(NSString *)str{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormat dateFromString:str];
}

+ (NSString *)timeStringFromDate:(NSDate *)date{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormat stringFromDate:date];
}

+ (NSString *)timeStringYMDFromDate:(NSDate *)date{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    return [dateFormat stringFromDate:date];
}

+ (NSString *)compareTime:(NSString *)time{
    NSDateFormatter *dateFomatter = [[NSDateFormatter alloc] init];
    
    dateFomatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // 截止时间data格式
    NSDate * expireDate = [dateFomatter dateFromString:time];
    // 当前时间data格式
    NSDate * nowDate = [NSDate date];
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 需要对比的时间数据
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth
    | NSCalendarUnitDay ;
    // 对比时间差
    NSDateComponents *dateCom = [calendar components:unit fromDate:nowDate toDate:expireDate options:0];
    
    if (dateCom.year) {
        dateFomatter.dateFormat = @"yyyy-MM-dd";
        return [dateFomatter stringFromDate:expireDate];
    }
    if (dateCom.month) {
        dateFomatter.dateFormat = @"MM-dd";
        return [dateFomatter stringFromDate:expireDate];
    }
    if (dateCom.day) {
        dateFomatter.dateFormat = @"MM-dd HH:mm";
        return [dateFomatter stringFromDate:expireDate];
    }
    
    dateFomatter.dateFormat = @"MM-dd HH:mm";
    return [dateFomatter stringFromDate:expireDate];
    
}


- (NSInteger)year {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)month {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)day {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)weekday {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self] weekday];
}

- (BOOL)isToday {
    if (fabs(self.timeIntervalSinceNow) >= 60 * 60 * 24) return NO;
    return [NSDate new].day == self.day;
}

- (NSUInteger)numberOfDaysInMonth {
    return [[[NSCalendar currentCalendar] initWithCalendarIdentifier:NSCalendarIdentifierGregorian] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self].length;
}

- (NSString *)stringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    [formatter setLocale:[NSLocale currentLocale]];
    return [formatter stringFromDate:self];
}

- (NSDate *)dateByAddingMonths:(NSInteger)months {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:months];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:dateString];
}

+ (NSString *)getTimestamp:(NSDate *)date{
    NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}


@end
