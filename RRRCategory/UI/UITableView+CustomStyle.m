//
//  UITableView+CustomStyle.m
//  RRRCategoryDemo
//
//  Created by 任敬 on 2018/11/26.
//  Copyright © 2018 任敬. All rights reserved.
//

#import "UITableView+CustomStyle.h"

@implementation UITableView (CustomStyle)

- (void)setHeaderViewBankgroundColor:(UIColor *)color{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectOffset(self.bounds, 0, -self.bounds.size.height)];
    bgView.backgroundColor = color;
    [self insertSubview:bgView atIndex:0];
}

@end
