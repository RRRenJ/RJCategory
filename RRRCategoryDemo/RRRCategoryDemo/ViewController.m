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
#import "NSString+CustomMethod.h"

#import "UITableView+CustomStyle.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self customUI];
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary * dict = @{@"xxxx":@"455",@"1xxxx":@"455",@"3xxxx":@"455"};
    NSLog(@"%@",[dict toJSON]);
    
    
    UIButton * bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(100, 100,100, 50);
//    [bt cutRoundWithRadius:30];
    [bt cutRoundWithRadius:40 byRoundingCorners:UIRectCornerAllCorners];

    [self.view addSubview:bt];
    
    bt.backgroundColor = [UIColor blackColor];
    
    UIButton * bt1 = [UIButton buttonWithType:UIButtonTypeCustom];
    bt1.frame = CGRectMake(100, 200,100, 50);

    bt1.layer.cornerRadius = 30;
    bt.layer.masksToBounds = YES;
    
    [self.view addSubview:bt1];
    
    bt1.backgroundColor = [UIColor blackColor];
    
    
    
    [bt addTarget:self action:@selector(xxxxx) forControlEvents:UIControlEventTouchUpInside];
  
    [self.tableView setHeaderViewBankgroundGradientfromColor:[UIColor greenColor] toColor:[UIColor blueColor]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)xxxxx{
//    [self loadData];
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
