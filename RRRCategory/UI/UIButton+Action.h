//
//  UIButton+Action.h
//  RRRCategoryDemo
//
//  Created by 任敬 on 2018/12/13.
//  Copyright © 2018 任敬. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ActionCallBack)(UIButton *button);

@interface UIButton (Action)

@property (nonatomic, copy) ActionCallBack callBack;

/**
 addTarget:forControlEvents:

 @param callBack block
 @param controlEvents UIControlEvents
 */
- (void)addCallBackAction:(ActionCallBack)callBack forControlEvents:(UIControlEvents)controlEvents;

/**
 addTarget:forControlEvents:UIControlEventTouchUpInside

 @param callBack ActionCallBack
 */
- (void)addClickAction:(ActionCallBack)callBack;


@end

NS_ASSUME_NONNULL_END
