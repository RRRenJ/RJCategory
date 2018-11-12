//
//  UIColor+GradientColor.h
//  GlobalTrading
//
//  Created by 任敬 on 2018/9/11.
//  Copyright © 2018年 任敬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (GradientColor)

+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(UIColor *)fromColor toColor:(UIColor *)toColor fromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint;

@end
