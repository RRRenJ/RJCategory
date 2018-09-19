//
//  UIAlertController+Simple.h
//  RACDemo
//
//  Created by 任敬 on 2018/1/16.
//  Copyright © 2018年 任敬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Simple)

/**
 简易创建alert

 @param title title  为nil时就没有title
 @param message message
 @param style UIAlertControllerStyle
 @param actions @[@{@"第一":[NSNumber numberWithInt:UIAlertActionStyleDefault]},@{@"第二":[NSNumber numberWithInt:UIAlertActionStyleDefault]},@{@"取消":[NSNumber numberWithInt:UIAlertActionStyleCancel]}]
 @param handler integer 为选中选项
 @return UIAlertController
 */
+ (UIAlertController *)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)style actions:(NSArray <NSDictionary <NSString *,NSNumber *>*>*)actions actionHandler:(void (^)(NSInteger integer))handler;

@end
