//
//  UINavigationController+CustomStyle.h
//  Signature
//
//  Created by 任敬 on 2018/3/15.
//  Copyright © 2018年 任敬. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UINavigationController (CustomStyle)
//导航栏透明
- (void)setNavigationBarTranslucent;
//导航栏不透明
- (void)setNavigationBarOpacity;
//导航栏背景颜色
- (void)setNavigationBarColor:(UIColor *)color;
//导航栏文字颜色
- (void)setNavigationBarTitleColor:(UIColor *)color;





@end
