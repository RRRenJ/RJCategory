//
//  UIAlertController+Simple.h
//  RACDemo
//
//  Created by 任敬 on 2018/1/16.
//  Copyright © 2018年 任敬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Simple)

+ (UIAlertController *)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)style actions:(NSArray <NSDictionary <NSString *,NSNumber *>*>*)actions actionHandler:(void (^)(NSInteger integer))handler;

@end
