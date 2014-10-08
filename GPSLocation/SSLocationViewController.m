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
#import "AppDelegate.h"

#define SS_URL   @"http://www.999dh.net/GpsLocation/ssRequest.php"

@interface SSLocationViewController ()<ASIHTTPRequestDelegate,UIAlertViewDelegate>
{
    RockWaitView * _waitView;
    UITextField * _phoneField;
    
    UILabel * _phoneInfo;
    
    BOOL _evaluateFlag;
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


-(void)textFieldDidChange:(UITextField*)field
{
    if( [field.text length] >= 7 )
    {
        if( [field.text length] == 7 )
        {
            NSString * str = [field.text substringToIndex:7];
            
            AppDelegate * AppDel = (AppDelegate*)[[UIApplication sharedApplication] delegate];
            //_phoneInfo.text = [AppDel getPhoneInfo:str];
            
            [AppDel getPhoneInfo:str withLabel:_phoneInfo];
            
            NSLog(@"_info:%@",_phoneInfo.text);
        }
        
    }
    else
    {
        _phoneInfo.text = @"";
    }
}

-(void)layoutPhoneNum
{
    CGRect rect = CGRectMake(60, 25, 120, 20);

    //
    UILabel * lab = [[UILabel alloc]initWithFrame:rect];
    lab.textAlignment = NSTextAlignmentLeft;
    lab.text = @"电话号码:";
    lab.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:lab];
    
    //
    rect = CGRectMake(130, 22, 120, 25);
    _phoneField = [[UITextField alloc]initWithFrame:rect];
    
    _phoneField.keyboardType = UIKeyboardTypeNumberPad;
    _phoneField.borderStyle = UITextBorderStyleRoundedRect;
    [_phoneField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [self.view addSubview:_phoneField];
    

    //
    rect = CGRectMake(260, 22, 50, 25);
    UIButton * btn = [[UIButton alloc]initWithFrame:rect];
    [btn setTitle:@"定位" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    btn.backgroundColor = [UIColor orangeColor];
    btn.layer.cornerRadius = 5;
    [btn addTarget:self action:@selector(locationClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    //
    
    rect = CGRectMake(60, 50, 220, 20);
    _phoneInfo = [[UILabel alloc]initWithFrame:rect];
    _phoneInfo.textAlignment = NSTextAlignmentCenter;
    _phoneInfo.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_phoneInfo];
}


-(void)locationClicked
{
    NSLog(@"locationClicked");
    
    if( [_phoneField.text length] < 11 )
    {
        UIAlertView * alter = [[UIAlertView alloc]initWithTitle:@"错误" message:@"输入的电话号码不正确" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
        
        return;
    }
    
    
    if( !_evaluateFlag )
    {
        [self EvaluateTip];
        
    }
    else
    {
        [self hideKeyboard];
        
        [self startRequest];
    }
}

-(void)EvaluateTip
{
    UIAlertView * alter = [[UIAlertView alloc]initWithTitle:@"提示" message:@"信息正在传输中，给个~好评吧~，定位更准确！！" delegate:self cancelButtonTitle:@"给好评" otherButtonTitles:@"无情拒绝", nil];
    
    [alter show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"index:%d",buttonIndex);
    
    if( 0 == buttonIndex )
    {
        _evaluateFlag = YES;
        
        NSString *str =  [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@",@"884886468"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }
    else
    {
       
    }
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
    
    [self hideKeyboard];
    
    [self dismissViewControllerAnimated:YES completion:^(void){
        
    }];
}

-(void)layoutMapView
{
    CGRect rect = CGRectMake(0, 70, [[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height - 70);
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


-(void)hideKeyboard
{
    [_phoneField resignFirstResponder];
}

@end
