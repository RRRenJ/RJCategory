//
//  UILabel+LabelHeight.h
//  Store
//
//  Created by 任敬 on 2017/7/6.
//  Copyright © 2017年 任敬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LabelSize)
//获取UILabel长度
+ (CGFloat)getWidthByTitle:(NSString *)title AndFont:(CGFloat)font;
//获取UILabel高度
+ (CGFloat)getHeightByWidth:(CGFloat)width andTitle:(NSString *)title andFont:(CGFloat)font andNumberOfLines:(NSInteger)number;
@end
