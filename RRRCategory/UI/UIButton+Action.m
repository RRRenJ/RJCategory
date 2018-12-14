//
//  UIButton+Action.m
//  RRRCategoryDemo
//
//  Created by 任敬 on 2018/12/13.
//  Copyright © 2018 任敬. All rights reserved.
//

#import "UIButton+Action.h"
#import <objc/runtime.h>
static const void * ActionCallBackKey = &ActionCallBackKey;

@implementation UIButton (Action)

- (void)addCallBackAction:(ActionCallBack)callBack forControlEvents:(UIControlEvents)controlEvents{
    [self setCallBack:callBack];
    [self addTarget:self action:@selector(actionBtClicked:) forControlEvents:controlEvents];
}

-  (void)addClickAction:(ActionCallBack)callBack{
    [self addCallBackAction:callBack forControlEvents:UIControlEventTouchUpInside];
}

- (void)actionBtClicked:(UIButton *)sender{
    self.callBack(sender);
}


- (ActionCallBack)callBack{
    return objc_getAssociatedObject(self, ActionCallBackKey);
}

- (void)setCallBack:(ActionCallBack)callBack{
    return objc_setAssociatedObject(self, ActionCallBackKey, callBack, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

