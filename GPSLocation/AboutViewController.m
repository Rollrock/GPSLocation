//
//  AboutViewController.m
//  GPSLocation
//
//  Created by zhuang chaoxiao on 14-10-2.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "AboutViewController.h"
#import "ASIFormDataRequest.h"
#import "RockWaitView.h"



#define FIRST_NVRAM @"about_first"
#define SECOND_NVRAM @"about_second"
#define THIRD_NVRAM @"about_third"
#define FOURTH_NVRAM @"about_fourth"

@interface AboutViewController ()
{
    UIAlertView * _alterView;
    
    RockWaitView * _waitView;
}

@property (weak, nonatomic) IBOutlet UIView *_infoBgView;
@property (weak, nonatomic) IBOutlet UIButton *_backBtn;


@property (weak, nonatomic) IBOutlet UITextField *_firstNum;
@property (weak, nonatomic) IBOutlet UITextField *_fsecondNum;
@property (weak, nonatomic) IBOutlet UITextField *_thirdNum;
@property (weak, nonatomic) IBOutlet UITextField *_fourthNum;

- (IBAction)backClicked;
- (IBAction)saveClicked;
- (IBAction)numChanged:(id)sender;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    //
    [self._backBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    //
    self._infoBgView.layer.cornerRadius = 10;
    
    //
    
    
    //
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    
    NSString * str = [def stringForKey:FIRST_NVRAM];
    [self._firstNum setText:str];
    str= nil;
    
    str = [def stringForKey:SECOND_NVRAM];
    [self._fsecondNum setText:str];
    str= nil;
    
    str = [def stringForKey:THIRD_NVRAM];
    [self._thirdNum setText:str];
    str= nil;
    
    
    str = [def stringForKey:FOURTH_NVRAM];
    [self._fourthNum setText:str];
    str= nil;
    
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



- (IBAction)backClicked {
    
    [self hideKeypad];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveClicked {
    
    [self hideKeypad ];
    
    
    _waitView = [[RockWaitView alloc]initWithParentView:self.view withStr:@"等待中,请稍后"];
    
    [self sentValueToServer];
}

-(void)hideKeypad
{
    [self._firstNum resignFirstResponder];
    [self._fsecondNum resignFirstResponder];
    [self._thirdNum resignFirstResponder];
    [self._fourthNum resignFirstResponder];
}



- (IBAction)numChanged:(id)sender {
    
    UITextField * field = (UITextField *)sender;
    
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    
    if( field == self._firstNum )
    {
        [def setValue:field.text forKey:FIRST_NVRAM];
    }
    else if (field == self._fsecondNum )
    {
        [def setValue:field.text forKey:SECOND_NVRAM];
    }
    else if( field == self._thirdNum )
    {
        [def setValue:field.text forKey:THIRD_NVRAM];
    }
    else if( field == self._fourthNum)
    {
        [def setValue:field.text forKey:FOURTH_NVRAM];
    }
    
    [def synchronize];

}




-(void)sentValueToServer
{
    NSURL * url = [NSURL URLWithString:@"http://www.999dh.net/GpsLocation/request.php"];
    ASIFormDataRequest * req = [ASIFormDataRequest requestWithURL:url];
    req.delegate = self;
    
    ///
    
    [req setPostValue:self._firstNum.text forKey:@"firstNum"];
    [req setPostValue:self._fsecondNum.text forKey:@"firstNum"];
    [req setPostValue:self._firstNum.text forKey:@"firstNum"];
    [req setPostValue:self._firstNum.text forKey:@"firstNum"];
    
    [req startSynchronous];
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSString * resStr = [request responseString];
    NSData * data = [request responseData];
    
    NSLog(@"resStr:%@",resStr);
    
    [_waitView dismiss];
    
    [self successPop];
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    
    NSLog(@"error:%@",error);
    
    [_waitView dismiss];
}

-(void)successPop
{
    _alterView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"设置成功,数据将在启动时生效！" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [_alterView show];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(dismissAlter) userInfo:nil repeats:NO];
}

-(void)dismissAlter
{
    [_alterView dismissWithClickedButtonIndex:0 animated:YES];
    _alterView = nil;
    
   // [self dismissViewControllerAnimated:YES completion:nil];
}



@end
