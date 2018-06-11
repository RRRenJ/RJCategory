//
//  UINavigationItem+CustomStyle.m
//  Signature
//
//  Created by 任敬 on 2018/3/15.
//  Copyright © 2018年 任敬. All rights reserved.
//

#import "UINavigationItem+CustomStyle.h"

@implementation UINavigationItem (CustomStyle)


- (void)customBarButtonsWithImage:(NSString *)imgName location:(BarButtonLocation)location{
    UIBarButtonItem *items ;
    if (location == BarButtonLocationLeft) {
        items = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonTapped:)];
        self.leftBarButtonItem = items;
    }else{
        items = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonTapped:)];
        self.rightBarButtonItem = items;
    }
}

- (void)customBarButtonsWithTitle:(NSString *)title location:(BarButtonLocation)location{
    UIBarButtonItem *item;
    if (location == BarButtonLocationLeft) {
        item = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonTapped:)];
         [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} forState:UIControlStateHighlighted];
        self.leftBarButtonItem = item;
    }
    else{
        item = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonTapped:)];
         [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} forState:UIControlStateNormal];
         [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} forState:UIControlStateHighlighted];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} forState:UIControlStateSelected];
        self.rightBarButtonItem = item;
        
    }
}

- (void)customReturnWithImage:(NSString *)imgName{
    UIBarButtonItem * returnItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonTapped:)];
    self.leftBarButtonItem = returnItem;
   
}



- (void)leftBarButtonTapped:(UIBarButtonItem *)sender{
    
}

- (void)rightBarButtonTapped:(UIBarButtonItem *)sender{
    
}


@end
