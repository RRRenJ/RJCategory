//
//  UINavigationController+CustomStyle.m
//  Signature
//
//  Created by 任敬 on 2018/3/15.
//  Copyright © 2018年 任敬. All rights reserved.
//

#import "UINavigationController+CustomStyle.h"

@implementation UINavigationController (CustomStyle)



- (void)setNavigationBarTranslucent{
    self.navigationBar.translucent = YES;
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    
}

- (void)setNavigationBarOpacity{
    self.navigationBar.translucent = NO;
    [self.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:nil];
}

- (void)setNavigationBarColor:(UIColor *)color{
    self.navigationBar.barTintColor = color;
}

- (void)setNavigationBarTitleColor:(UIColor *)color{
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:color,NSFontAttributeName:[UIFont systemFontOfSize:17]}];
}





@end
