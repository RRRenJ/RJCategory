//
//  UINavigationItem+CustomStyle.h
//  Signature
//
//  Created by 任敬 on 2018/3/15.
//  Copyright © 2018年 任敬. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, BarButtonLocation){
    BarButtonLocationLeft,
    BarButtonLocationRight,
    
};


@interface UINavigationItem (CustomStyle)

//barButton
- (void)customBarButtonsWithImage:(NSString *)imgName location:(BarButtonLocation)location;
- (void)customBarButtonsWithTitle:(NSString *)title titleColor:(UIColor *)color location:(BarButtonLocation)location;

- (void)customReturnWithImage:(NSString *)imgName;

- (void)leftBarButtonTapped:(UIBarButtonItem *)sender;
- (void)rightBarButtonTapped:(UIBarButtonItem *)sender;

@end
