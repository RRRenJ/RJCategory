//
//  UITableView+CustomStyle.h
//  RRRCategoryDemo
//
//  Created by 任敬 on 2018/11/26.
//  Copyright © 2018 任敬. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (CustomStyle)

- (void)setHeaderViewBankgroundColor:(UIColor *)color;

- (void)setHeaderViewBankgroundGradientfromColor:(UIColor *)fromColor toColor:(UIColor *)toColor;

@end

NS_ASSUME_NONNULL_END
