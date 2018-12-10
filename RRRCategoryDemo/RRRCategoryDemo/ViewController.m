//
//  ViewController.m
//  RRRCategoryDemo
//
//  Created by 任敬 on 2018/6/11.
//  Copyright © 2018年 任敬. All rights reserved.
//

#import "ViewController.h"
#import "RRRCategory.h"
//#import "UINavigationController+CustomStyle.h"
//#import "UIView+cutRound.h"
#import "NSObject+Json.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customUI];
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary * dict = @{@"xxxx":@"455",@"1xxxx":@"455",@"3xxxx":@"455"};
    NSLog(@"%@",[dict toJSON]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customUI{
  
//    [self.navigationItem customBarButtonsWithTitle:@"回去" titleColor:[UIColor blackColor] location:BarButtonLocationRight];
    [self.navigationController setNavigationBarBackImage:@"1111" andXImage:@"1111"];
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor blackColor];
    [view cutRoundWithRadius:10 byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight];
    
    
}

@end
