//
//  UIView+cutRound.h
//  Crowdfunding
//
//  Created by 任敬 on 2017/12/18.
//  Copyright © 2017年 任敬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (cutRound)

/**
 4角切圆

 @param radius 圆角半径
 @param isAuto 是否是AutoLayout布局
 */
- (void)cutRoundWithRadius:(CGFloat)radius isAutoLayout:(BOOL)isAuto;

/**
 切圆

 @param radius 圆角半径
 @param corners 圆角位置
  @param isAuto 是否是AutoLayout布局
 */
- (void)cutRoundWithRadius:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners isAutoLayout:(BOOL)isAuto;

@end
