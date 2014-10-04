//
//  HistoryViewController.m
//  GPSLocation
//
//  Created by zhuang chaoxiao on 14-10-2.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //
    [self layoutBack];
    
    
    self.view.backgroundColor = [UIColor grayColor];
}


-(void)layoutBack
{
    CGRect rect =  CGRectMake(10, 20, 40, 40);
    UIButton * btn = [[UIButton alloc]initWithFrame:rect];
    [btn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    btn.layer.cornerRadius = 20;
    [btn addTarget:self action:@selector(btnBack) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}


-(void)btnBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
