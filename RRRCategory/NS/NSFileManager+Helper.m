//
//  NSFileManager_Helper.m
//  FirstVideo
//
//  Created by doorxp1 on 14-7-9.
//  Copyright (c) 2014年 doorxp1. All rights reserved.
//

#import "NSFileManager+Helper.h"
#include <sys/param.h>
#include <sys/mount.h>

@implementation NSFileManager(Helper)
+ (BOOL)fileExist:(NSString *)path
{
    if(path == nil)
    {
        return NO;
    }
    
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

+ (BOOL)dirExist:(NSString *)path
{
    BOOL isDirecotry = NO;
    if (![[NSFileManager defaultManager] fileExistsAtPath:path
                                              isDirectory:&isDirecotry]
        || !isDirecotry)
    {
        isDirecotry = NO;
    }
    
    return isDirecotry;
}

+ (BOOL)mkDir:(NSString *)path
{
    BOOL isSecc = YES;
    NSError *erro = nil;
    if (![NSFileManager dirExist:path])
    {
        if(![[NSFileManager defaultManager] createDirectoryAtPath:path
                                      withIntermediateDirectories:YES
                                                       attributes:nil
                                                            error:&erro]
           || erro != nil)
        {
            NSAssert(0, @"文件夹创建失败！");
            isSecc = NO;
        }
    }
    
    return isSecc;
}


+ (BOOL)copy:(NSString *)from to:(NSString *)to
{
    NSError *error = nil;
    BOOL bRet = [[NSFileManager defaultManager] copyItemAtPath:from toPath:to error:&error];
    if (error)
        NSLog(@"%@",error);
    return bRet;
}

+ (BOOL)move:(NSString *)from to:(NSString *)to
{
    NSError *error = nil;
    BOOL bRet = [[NSFileManager defaultManager] moveItemAtPath:from toPath:to error:&error];
    if (error)
        NSLog(@"%@",error);
    return bRet;
}

+ (BOOL)deleteFile:(NSString*)path
{
    NSError *error = nil;
    BOOL bRet = [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
    return bRet;
}
+ (BOOL)saveData:(NSData *)data filePath:(NSString *)filePath{
    
    if (![NSFileManager mkDir:[filePath stringByDeletingLastPathComponent]]) {
        
        NSAssert(0, @"路径不存在");
        return NO;
    }
    
    return [data writeToFile:filePath atomically:YES];
}

+ (UIImage *)getImageFileName:(NSString *)filePath{
    
    if (![NSFileManager fileExist:filePath]) {
        
        NSAssert(0, @"路径不存在");
        return nil;
    }
    return [UIImage imageWithContentsOfFile:filePath];
}

+ (NSString *)freeDiskSpaceInBytes{
    struct statfs buf;
    unsigned long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0) {
        freeSpace = (unsigned long long)(buf.f_bsize * buf.f_bavail);
    }
    NSString *str = [NSString stringWithFormat:@"%0.2lld",freeSpace/1024/1024];
    return str;
}

@end
