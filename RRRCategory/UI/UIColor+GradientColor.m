//
//  UIColor+GradientColor.m
//  GlobalTrading
//
//  Created by 任敬 on 2018/9/11.
//  Copyright © 2018年 任敬. All rights reserved.
//

#import "UIColor+GradientColor.h"

@implementation UIColor (GradientColor)

+(CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(UIColor *)fromColor toColor:(UIColor *)toColor fromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint{
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds;
    
    gradientLayer.colors = @[(__bridge id)fromColor.CGColor,(__bridge id)toColor.CGColor];
    gradientLayer.startPoint = fromPoint;
    gradientLayer.endPoint = toPoint;
    gradientLayer.locations = @[@0,@1];
    return gradientLayer;
}


@end
