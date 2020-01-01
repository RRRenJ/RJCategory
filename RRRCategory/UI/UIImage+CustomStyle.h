//
//  UIImage+CustomStyle.h
//  Signature
//
//  Created by 任敬 on 2018/3/15.
//  Copyright © 2018年 任敬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CustomStyle)


/**
 图片切圆
 */
- (UIImage *)cutCircleImage;
/**
 修改图片尺寸
 */
- (UIImage *)modifyImageToSize:(CGSize)reSize;
/**
 修正照片方向 垂直方向
 */
- (UIImage *)fixOrientation;
//旋转图片
- (UIImage*)rotate:(UIImageOrientation)orient;
//获取视频第一帧图片
+ (UIImage *)getScreenShotImageFromVideoURL:(NSString *)fileurl;
//根据url获取图片尺寸
+ (CGSize)getImageSizeWithURL:(id)URL;


//给图片换颜色
-(UIImage*)imageChangeColor:(UIColor*)color;
/// 根据颜色返回一张对应的图片
+ (UIImage *)imageWithColor:(UIColor *)color;
/// 返回一张可拉伸的图片
+ (instancetype)resizeImageNamed:(NSString *)name;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size isRound:(BOOL)isRound;

@end
