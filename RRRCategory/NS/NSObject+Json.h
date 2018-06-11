//
//  NSObject+Json.h
//  pm
//
//  Created by Mon on 7/5/15.
//  Copyright (c) 2015 Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Json)

/**
 字典转为Json

 @return Json
 */
- (NSString *)toJSON;

/**
 解析Json

 @return Dict or NSArray
 */
- (id)parserJSON;

/**
 模型转Dict

 @return Dict
 */
- (NSDictionary *)modelToDictionary;
@end
