//
//  UITableView+CustomStyle.m
//  RRRCategoryDemo
//
//  Created by 任敬 on 2018/11/26.
//  Copyright © 2018 任敬. All rights reserved.
//

#import "UITableView+CustomStyle.h"
#import "UIColor+GradientColor.h"

@implementation UITableView (CustomStyle)

- (void)setHeaderViewBankgroundColor:(UIColor *)color{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectOffset(self.bounds, 0, -self.bounds.size.height)];
    bgView.backgroundColor = color;
    [self insertSubview:bgView atIndex:0];
}

- (void)setHeaderViewBankgroundGradientfromColor:(UIColor *)fromColor toColor:(UIColor *)toColor{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectOffset(self.bounds, 0, -self.bounds.size.height)];
    CAGradientLayer * layer = [UIColor setGradualChangingColor:bgView fromColor:fromColor toColor:toColor fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(1, 0)];
    [bgView.layer addSublayer:layer];
    [self insertSubview:bgView atIndex:0];
}

@end
