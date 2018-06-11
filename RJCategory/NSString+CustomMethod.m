//
//  NSString+CustomMethod.m
//  RRRCustom
//
//  Created by 任敬 on 2018/5/23.
//  Copyright © 2018年 任敬. All rights reserved.
//

#import "NSString+CustomMethod.h"

@implementation NSString (CustomMethod)

-(BOOL)isNull{
    // 判断是否为空串
    if ([self isEqual:[NSNull null]]) {
        return YES;
    }
    else if ([self isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    else if (self==nil){
        return YES;
    }
    return NO;
}

-(NSString*)nullConvertIntoZero{
    
    // 转换空串
    if ([self isEqual:[NSNull null]]) {
        return @"0";
    }
    else if ([self isKindOfClass:[NSNull class]])
    {
        return @"0";
    }
    else if (self==nil){
        return @"0";
    }
    return self;
    
}

-(NSString *)nullConvertIntoSpace{
    // 转换空串
    if ([self isEqual:[NSNull null]]) {
        return @" ";
    }
    else if ([self isKindOfClass:[NSNull class]])
    {
        return @" ";
    }
    else if (self==nil){
        return @" ";
    }
    return self;
}

-(NSString *)nullConvertIntoNothing{
    
    
    if ([self isEqual:[NSNull null]]) {
        return @"";
    }
    else if ([self isKindOfClass:[NSNull class]])
    {
        return @"";
    }
    else if (self==nil){
        return @"";
    }
    return self;
}


- (BOOL)isValidatePhoneNumber{
    NSString *phoneNumberRegex = @"^1[345789]\\d{9}$";
    NSPredicate *phoneNumberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneNumberRegex];
    return [phoneNumberTest evaluateWithObject:self];
}

- (BOOL)isValidatePassword{
    NSString *passwordRegex = @"^[0-9a-zA-Z~@#$%^&*()]{6,16}$";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    return [passwordTest evaluateWithObject:self];
}

- (BOOL)isValidateJustLongPassword{
    NSString *passwordRegex = @"^.{6,16}$";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    return [passwordTest evaluateWithObject:self];
}

- (BOOL)isValidateJustInteger{
    NSString *passwordRegex = @"^[0-9]*$";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    return [passwordTest evaluateWithObject:self];
}

- (BOOL)isPureFloat{
    
    NSScanner* scan = [NSScanner scannerWithString:self];
    
    float val;
    
    return[scan scanFloat:&val] && [scan isAtEnd];
    
}

- (BOOL)isPureInt{
    
    NSScanner* scan = [NSScanner scannerWithString:self];
    
    int val;
    
    return[scan scanInt:&val] && [scan isAtEnd];
    
}
@end
