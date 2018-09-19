//
//  UIAlertController+Simple.m
//  RACDemo
//
//  Created by 任敬 on 2018/1/16.
//  Copyright © 2018年 任敬. All rights reserved.
//

#import "UIAlertController+Simple.h"

@implementation UIAlertController (Simple)


+ (UIAlertController *)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)style actions:(NSArray <NSDictionary <NSString *,NSNumber *>*>*)actions actionHandler:(void (^)(NSInteger integer))handler{
     UIAlertController * alertController;
    if (title) {
        alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    }else{
        alertController =  [[UIAlertController alloc]init];
    }

    for (int index = 0; index < actions.count ; index ++) {
        NSNumber * number = actions[index].allValues.firstObject;
        UIAlertActionStyle style = number.integerValue;
        UIAlertAction * action = [UIAlertAction actionWithTitle:actions[index].allKeys.firstObject style:style handler:^(UIAlertAction * _Nonnull action) {
            handler(index);
        }];
        
        
        [alertController addAction:action];
    }
    return alertController;
}


@end
