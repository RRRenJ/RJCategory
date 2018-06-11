//
//  NSObject+Json.m
//  pm
//
//  Created by Mon on 7/5/15.
//  Copyright (c) 2015 Thomas. All rights reserved.
//

#import "NSObject+Json.h"
#import <objc/runtime.h>

@implementation NSObject (Json)

// 将字典或者数组转化为JSON串
- (NSString *)toJSON{
    if ([self  isKindOfClass:[NSDictionary class]]) {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        if ([jsonData length] > 0 && error == nil){
            return [[NSString alloc] initWithData:jsonData
                                         encoding:NSUTF8StringEncoding];;
        }else{
            return nil;
        }
    }else{
        return nil;
    }
    
}

// 将JSON串转化为字典或者数组

- (id)parserJSON{
    if ([self isKindOfClass:[NSString class]]) {
        NSData *jsonData = [(NSString *)self dataUsingEncoding:NSUTF8StringEncoding];
        if (jsonData == nil) {
            return nil;
        }
        NSError *error = nil;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingAllowFragments
                                                          error:&error];
        if (jsonObject != nil && error == nil){
            return jsonObject;
        }else{
            // 解析错误
            return nil;
        }
    }else{
        return nil;
    }
    
}

-(NSDictionary *)modelToDictionary{
    NSMutableDictionary *userDic = [NSMutableDictionary dictionary];
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        const char *name = property_getName(properties[i]);
        
        NSString *propertyName = [NSString stringWithUTF8String:name];
        id propertyValue = [self valueForKey:propertyName];
        if (propertyValue) {
            [userDic setObject:propertyValue forKey:propertyName];
        }
        
    }
    free(properties);
    
    return userDic.copy;
}



@end
