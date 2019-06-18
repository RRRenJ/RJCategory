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

// 将字典转化为JSON串
- (NSString *)toJSON{
    if ([self  isKindOfClass:[NSDictionary class]] || [self  isKindOfClass:[NSArray class]]) {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        if ([jsonData length] > 0 && error == nil){
            NSString * jsonStr = [[NSString alloc] initWithData:jsonData
                                                       encoding:NSUTF8StringEncoding];
            jsonStr = [jsonStr stringByReplacingOccurrencesOfString:@" " withString:@""];
            jsonStr = [jsonStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            return jsonStr;
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
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertyList[i];
        const char *cName = property_getName(property);
        NSString *name = [NSString stringWithUTF8String:cName];
        NSObject *value = [self valueForKey:name];//valueForKey返回的数字和字符串都是对象
        
        if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
            //string , bool, int ,NSinteger
            [dic setObject:value forKey:name];
            
        } else if ([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSDictionary class]]) {
            //字典或字典
            [dic setObject:[self arrayOrDicWithObject:(NSArray*)value] forKey:name];
            
        } else if (value == nil) {
            //null
            //[dic setObject:[NSNull null] forKey:name];//这行可以注释掉?????
            
        } else {
            //model
            [dic setObject:[value modelToDictionary] forKey:name];
        }
    }
    
    return [dic copy];
}

//将可能存在model数组转化为普通数组
- (id)arrayOrDicWithObject:(id)origin {
    if ([origin isKindOfClass:[NSArray class]]) {
        //数组
        NSMutableArray *array = [NSMutableArray array];
        for (NSObject *object in origin) {
            if ([object isKindOfClass:[NSString class]] || [object isKindOfClass:[NSNumber class]]) {
                //string , bool, int ,NSinteger
                [array addObject:object];
                
            } else if ([object isKindOfClass:[NSArray class]] || [object isKindOfClass:[NSDictionary class]]) {
                //数组或字典
                [array addObject:[self arrayOrDicWithObject:(NSArray *)object]];
                
            } else {
                //model
                [array addObject:[object modelToDictionary]];
            }
        }
        
        return [array copy];
        
    } else if ([origin isKindOfClass:[NSDictionary class]]) {
        //字典
        NSDictionary *originDic = (NSDictionary *)origin;
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        for (NSString *key in originDic.allKeys) {
            id object = [originDic objectForKey:key];
            
            if ([object isKindOfClass:[NSString class]] || [object isKindOfClass:[NSNumber class]]) {
                //string , bool, int ,NSinteger
                [dic setObject:object forKey:key];
                
            } else if ([object isKindOfClass:[NSArray class]] || [object isKindOfClass:[NSDictionary class]]) {
                //数组或字典
                [dic setObject:[self arrayOrDicWithObject:object] forKey:key];
                
            } else {
                //model
                [dic setObject:[object modelToDictionary] forKey:key];
            }
        }
        
        return [dic copy];
    }
    
    return [NSNull null];
}


@end
