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


-(BOOL)validateMoney{
    NSString *phoneRegex = @"^[0-9]+(\\.[0-9]{0,2})?$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)validateTextFieldMoney{
    NSString *strRegex =  @"(\\+|\\-)?(([0]|(0[.]\\d{0,2}))|([1-9]\\d{0,9}(([.]\\d{0,2})?)))?";
    NSPredicate *strTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",strRegex];
    return [strTest evaluateWithObject:self];
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

- (NSString *)fileSize
{
    // 总大小
    unsigned long long size = 0;
    NSString *sizeText = nil;
    // 文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 文件属性
    NSDictionary *attrs = [mgr attributesOfItemAtPath:self error:nil];
    // 如果这个文件或者文件夹不存在,或者路径不正确直接返回0;
    if (attrs == nil)
        return @"0";
    if ([attrs.fileType isEqualToString:NSFileTypeDirectory]) { // 如果是文件夹
        // 获得文件夹的大小  == 获得文件夹中所有文件的总大小
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        for (NSString *subpath in enumerator) {
            // 全路径
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            // 累加文件大小
            size += [mgr attributesOfItemAtPath:fullSubpath error:nil].fileSize;
            
            if (size >= pow(10, 9)) { // size >= 1GB
                sizeText = [NSString stringWithFormat:@"%.2fGB", size / pow(10, 9)];
            } else if (size >= pow(10, 6)) { // 1GB > size >= 1MB
                sizeText = [NSString stringWithFormat:@"%.2fMB", size / pow(10, 6)];
            } else if (size >= pow(10, 3)) { // 1MB > size >= 1KB
                sizeText = [NSString stringWithFormat:@"%.2fKB", size / pow(10, 3)];
            } else { // 1KB > size
                sizeText = [NSString stringWithFormat:@"%lluB", size];
            }
            
        }
        return sizeText;
    } else { // 如果是文件
        size = attrs.fileSize;
        if (size >= pow(10, 9)) { // size >= 1GB
            sizeText = [NSString stringWithFormat:@"%.2fGB", size / pow(10, 9)];
        } else if (size >= pow(10, 6)) { // 1GB > size >= 1MB
            sizeText = [NSString stringWithFormat:@"%.2fMB", size / pow(10, 6)];
        } else if (size >= pow(10, 3)) { // 1MB > size >= 1KB
            sizeText = [NSString stringWithFormat:@"%.2fKB", size / pow(10, 3)];
        } else { // 1KB > size
            sizeText = [NSString stringWithFormat:@"%lluB", size];
        }
        
    }
    return sizeText;
}

- (NSInteger)fileSizeWithInteger
{
    // 总大小
    NSInteger size = 0;
    // 文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 文件属性
    NSDictionary *attrs = [mgr attributesOfItemAtPath:self error:nil];
    // 如果这个文件或者文件夹不存在,或者路径不正确直接返回0;
    if (attrs == nil)
        return 0;
    if ([attrs.fileType isEqualToString:NSFileTypeDirectory]) { // 如果是文件夹
        // 获得文件夹的大小  == 获得文件夹中所有文件的总大小
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        for (NSString *subpath in enumerator) {
            // 全路径
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            // 累加文件大小
            size += [mgr attributesOfItemAtPath:fullSubpath error:nil].fileSize;
            
            
        }
        return size;
    } else { // 如果是文件
        size = attrs.fileSize;
        return size;
    }
    
}


- (float)getHeightByWidth:(float)width font:(UIFont*)font{
    NSStringDrawingOptions  options = NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin;
    
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:options attributes:@{NSFontAttributeName:font} context:nil];
    
    return ceilf(rect.size.height);
}

- (float)getWidthByHeight:(float)height font:(UIFont*)font{
    NSStringDrawingOptions  options = NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin;
    
    CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:options attributes:@{NSFontAttributeName:font} context:nil];
    
    return ceilf(rect.size.width);
}

@end
