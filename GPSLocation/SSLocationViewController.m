//
//  SSLocationViewController.m
//  GPSLocation
//
//  Created by zhuang chaoxiao on 14-9-28.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "SSLocationViewController.h"
#import "ASIHTTPRequest.h"
#import "RockWaitView.h"
#import "ASIFormDataRequest.h"

#define SS_URL   @"http://www.999dh.net/GpsLocation/ssRequest.php"

@interface SSLocationViewController ()<ASIHTTPRequestDelegate>
{
    RockWaitView * _waitView;
    UITextField * _phoneField;
}
@end

@implementation SSLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self layoutPhoneNum];
    
    [self layoutBack];
    
    [self layoutMapView];
    
    
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)layoutPhoneNum
{
    CGRect rect = CGRectMake(60, 30, 120, 20);

    //
    UILabel * lab = [[UILabel alloc]initWithFrame:rect];
    lab.textAlignment = NSTextAlignmentLeft;
    lab.text = @"电话号码:";
    lab.font = [UIFont systemFontOfSize:11];
    [self.view addSubview:lab];
    
    //
    rect = CGRectMake(110, 30, 120, 20);
    _phoneField = [[UITextField alloc]initWithFrame:rect];
    
    _phoneField.keyboardType = UIKeyboardTypeNumberPad;
    _phoneField.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:_phoneField];
    

    //
    rect = CGRectMake(240, 30, 50, 20);
    UIButton * btn = [[UIButton alloc]initWithFrame:rect];
    [btn setTitle:@"定位" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:11];
    btn.backgroundColor = [UIColor orangeColor];
    btn.layer.cornerRadius = 5;
    [btn addTarget:self action:@selector(locationClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}


-(void)locationClicked
{
    NSLog(@"locationClicked");
    
    [self startRequest];
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
    [self dismissViewControllerAnimated:YES completion:^(void){
        
    }];
}

-(void)layoutMapView
{
    CGRect rect = CGRectMake(0, 60, [[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height - 60);
    UIView * view = [[UIView alloc]initWithFrame:rect];
    
    view.backgroundColor = [UIColor brownColor];
    
    [self.view addSubview:view];
}


-(void)startRequest
{
    _waitView = [[RockWaitView alloc]initWithParentView:self.view withStr:@"定位中,请稍后!"];
    
    //
    NSURL * url = [NSURL URLWithString:SS_URL];
    
    ASIFormDataRequest * req = [[ASIFormDataRequest alloc]initWithURL:url];
    req.delegate = self;
    
    [req setPostValue:_phoneField.text forKey:@"phoneNum"];
    
    [req startAsynchronous];
    
}


-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSString * resStr = [request responseString];
    NSData * data = [request responseData];
    
    NSLog(@"resStr:%@",resStr);
    
    
    [_waitView dismiss];
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    
    NSLog(@"error:%@",error);
    
    [_waitView dismiss];
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
