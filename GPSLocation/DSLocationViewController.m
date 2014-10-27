//
//  DSLocationViewController.m
//  GPSLocation
//
//  Created by zhuang chaoxiao on 14-9-28.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "DSLocationViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "RockWaitView.h"

#define DAY_1_STATE  @"day_1_state"
#define DAY_2_STATE  @"day_2_state"
#define DAY_3_STATE  @"day_3_state"
#define DAY_4_STATE  @"day_4_state"
#define DAY_5_STATE  @"day_5_state"
#define DAY_6_STATE  @"day_6_state"
#define DAY_7_STATE  @"day_7_state"

#define TIME_INTERVAL  @"time_interval"

#define BACKGROUND  @"background"
#define LOWPOWER    @"lowpower"

#define FIRST_TIME @"first_time"
#define SECOND_TIME @"second_time"
#define THIRD_TIME @"third_time"
#define FORTH_TIME @"forth_time"


#define PHONE_NUM  @"phone_num"


@interface DSLocationViewController ()<ASIHTTPRequestDelegate>
{

    RockWaitView * _waitView;
    UIAlertView * _alterView;
    
    int _timeInterval;

}


- (IBAction)dayClicked:(id)sender;

- (IBAction)backClicked;
- (IBAction)lowPowerChanged:(id)sender;
- (IBAction)backgroundChanged:(id)sender;
- (IBAction)intervalClicked:(id)sender;

- (IBAction)saveClicked:(id)sender;
- (IBAction)phoneNumValueChanged:(id)sender;
- (IBAction)timeChanged:(id)sender;


@property (weak, nonatomic) IBOutlet UISegmentedControl *_intervalSeg;

@property (weak, nonatomic) IBOutlet UIButton *_day_1;
@property (weak, nonatomic) IBOutlet UIButton *_day_2;
@property (weak, nonatomic) IBOutlet UIButton *_day_3;
@property (weak, nonatomic) IBOutlet UIButton *_day_4;

@property (weak, nonatomic) IBOutlet UIButton *_day_5;

@property (weak, nonatomic) IBOutlet UIButton *_day_6;
@property (weak, nonatomic) IBOutlet UIButton *_day_7;


@property (weak, nonatomic) IBOutlet UITextField *_forthTime;
@property (weak, nonatomic) IBOutlet UITextField *_thirdTime;
@property (weak, nonatomic) IBOutlet UITextField *_secondTime;
@property (weak, nonatomic) IBOutlet UITextField *_firstTime;

@property (weak, nonatomic) IBOutlet UITextField *_phoneTextField;
@property (weak, nonatomic) IBOutlet UISwitch *background;
@property (weak, nonatomic) IBOutlet UISwitch *lowPower;

@end

@implementation DSLocationViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self initControls];
    
    //
    UITapGestureRecognizer * g  = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeypad)];
    [self.view addGestureRecognizer:g];
    
    
}


-(void)initControls
{
    int val = 0;
    
    val = [self ReadSetting:DAY_1_STATE];
    [self initDays:val forBtn:self._day_1];
    
    val = [self ReadSetting:DAY_2_STATE];
    [self initDays:val forBtn:self._day_2];
    
    val = [self ReadSetting:DAY_3_STATE];
    [self initDays:val forBtn:self._day_3];
    
    val = [self ReadSetting:DAY_4_STATE];
    [self initDays:val forBtn:self._day_4];
    
    val = [self ReadSetting:DAY_5_STATE];
    [self initDays:val forBtn:self._day_5];
    
    val = [self ReadSetting:DAY_6_STATE];
    [self initDays:val forBtn:self._day_6];
    
    val = [self ReadSetting:DAY_7_STATE];
    [self initDays:val forBtn:self._day_7];
    
    //
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    
    NSString * strPhone = [def stringForKey:PHONE_NUM];
    [self._phoneTextField setText:strPhone];
    
    //
    val = [def integerForKey:TIME_INTERVAL];
    [self._intervalSeg setSelectedSegmentIndex:val];
    
    //
    val = [def integerForKey:FIRST_TIME];
    [self._firstTime setText:[NSString stringWithFormat:@"%d",val]];
    
    val = [def integerForKey:SECOND_TIME];
    [self._secondTime setText:[NSString stringWithFormat:@"%d",val]];
    
    val = [def integerForKey:THIRD_TIME];
    [self._thirdTime setText:[NSString stringWithFormat:@"%d",val]];
    
    val = [def integerForKey:FORTH_TIME];
    [self._forthTime setText:[NSString stringWithFormat:@"%d",val]];
    
    //
    
    val = [def integerForKey:BACKGROUND];
    [self.background setOn:val];
    
    val = [def integerForKey:LOWPOWER];
    [self.lowPower setOn:val];
}


-(void)initDays:(int)val forBtn:(UIButton*)btn
{
    if( val )
    {
        [btn setBackgroundImage:[UIImage imageNamed:@"day_select"] forState:UIControlStateNormal];
    }
    else
    {
        [btn setBackgroundImage:[UIImage imageNamed:@"day_un_select"] forState:UIControlStateNormal];
    }
    
    btn.layer.cornerRadius = btn.frame.size.width/2;
    btn.layer.masksToBounds = YES;

}

-(int)ReadSetting:(NSString*)str
{
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    
    int val = [def integerForKey:str];
    
    return val;
}

-(void)WriteSetting:(NSString*)str byValue:(int)val
{
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    
    [def setInteger:val forKey:str];
    
    [def synchronize];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)dayClicked:(id)sender {
    
    UIButton * btn = (UIButton * )sender;
    int val = 0;
    
    if( btn == self._day_1 )
    {
        val = [self ReadSetting:DAY_1_STATE];
        val = !val;
        [self initDays:val forBtn:self._day_1];
        [self WriteSetting:DAY_1_STATE byValue:val];
        
    }
    else if( btn == self._day_2 )
    {
        val = [self ReadSetting:DAY_2_STATE];
        val = !val;
        [self initDays:val forBtn:self._day_2];
        [self WriteSetting:DAY_2_STATE byValue:val];
    }
    else if( btn == self._day_3 )
    {
        val = [self ReadSetting:DAY_3_STATE];
        val = !val;
        [self initDays:val forBtn:self._day_3];
        [self WriteSetting:DAY_3_STATE byValue:val];
    }
    else if( btn == self._day_4 )
    {
        val = [self ReadSetting:DAY_4_STATE];
        val = !val;
        [self initDays:val forBtn:self._day_4];
        [self WriteSetting:DAY_4_STATE byValue:val];
    }
    else if( btn == self._day_5 )
    {
        val = [self ReadSetting:DAY_5_STATE];
        val = !val;
        [self initDays:val forBtn:self._day_5];
        [self WriteSetting:DAY_5_STATE byValue:val];
    }
    else if( btn == self._day_6 )
    {
        val = [self ReadSetting:DAY_6_STATE];
        val = !val;
        [self initDays:val forBtn:self._day_6];
        [self WriteSetting:DAY_6_STATE byValue:val];
    }
    else if( btn == self._day_7 )
    {
        val = [self ReadSetting:DAY_7_STATE];
        val = !val;
        [self initDays:val forBtn:self._day_7];
        [self WriteSetting:DAY_7_STATE byValue:val];
    }
}

- (IBAction)backClicked {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)lowPowerChanged:(id)sender {
    
    UISwitch * sw = (UISwitch*)sender;
    
    BOOL isON = [sw isOn];
    
    NSLog(@"isOn:%d",isON);
    
    [self WriteSetting:LOWPOWER byValue:isON];
    
}

- (IBAction)backgroundChanged:(id)sender {
    
    UISwitch * sw = (UISwitch*)sender;
    
    BOOL isON = [sw isOn];
    
    NSLog(@"isOn:%d",isON);
    
    [self WriteSetting:BACKGROUND byValue:isON];

}

- (IBAction)intervalClicked:(id)sender {
    
    [self hideKeypad];
    
    UISegmentedControl * seg = (UISegmentedControl*)sender;
    
    int index = seg.selectedSegmentIndex;
    
    NSLog(@"index:%d",index);
    
    switch( index )
    {
            case 0:
            _timeInterval = 5;
            break;
            
            case 1:
            _timeInterval = 15;
            break;
            
            case 2:
            _timeInterval = 30;
            break;
            
            case 3:
            _timeInterval = 60;
            break;
    }
    
    [self WriteSetting:TIME_INTERVAL byValue:index];
}

- (IBAction)saveClicked:(id)sender {
    
    
    if( [self._phoneTextField.text length] < 11 )
    {
        UIAlertView * alter = [[UIAlertView alloc]initWithTitle:@"错误" message:@"您输入的号码不正确！" delegate:self cancelButtonTitle:@"缺点" otherButtonTitles:nil, nil];
        
        [alter show];
        
        return;
    }
    
    _waitView = [[RockWaitView alloc]initWithParentView:self.view withStr:@"等待中,请稍后"];
    
    [self sentValueToServer];
   
}

- (IBAction)phoneNumValueChanged:(id)sender {
    
    UITextField * text = (UITextField*)sender;
    
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    [def setValue:text.text forKey:PHONE_NUM];
    [def synchronize];
    
    NSLog(@"phoneNum:%@",text.text);
    
}

- (IBAction)timeChanged:(id)sender {
    
    UITextField * text = (UITextField * )sender;
    
    if( text == self._firstTime )
    {
        [self WriteSetting:FIRST_TIME byValue:[text.text integerValue]];
    }
    else if( text == self._secondTime )
    {
        [self WriteSetting:SECOND_TIME byValue:[text.text integerValue]];
    }
    else if( text == self._thirdTime )
    {
        [self WriteSetting:THIRD_TIME byValue:[text.text integerValue]];
    }
    else if( text == self._forthTime )
    {
        [self WriteSetting:FORTH_TIME byValue:[text.text integerValue]];
    }
}


-(void)hideKeypad
{
    [self._phoneTextField resignFirstResponder];
    
    [self._firstTime resignFirstResponder];
    [self._secondTime resignFirstResponder];
    [self._thirdTime resignFirstResponder];
    [self._forthTime resignFirstResponder];
}


-(void)sentValueToServer
{
    NSURL * url = [NSURL URLWithString:@"http://www.999dh.net/GpsLocation/request.php"];
    ASIFormDataRequest * req = [ASIFormDataRequest requestWithURL:url];
    req.delegate = self;
    
    ///
    int days = 0;
    days += [self ReadSetting:DAY_1_STATE]<<1;
    days += [self ReadSetting:DAY_2_STATE]<<2;
    days += [self ReadSetting:DAY_3_STATE]<<3;
    days += [self ReadSetting:DAY_4_STATE]<<4;
    days += [self ReadSetting:DAY_5_STATE]<<5;
    days += [self ReadSetting:DAY_6_STATE]<<6;
    days += [self ReadSetting:DAY_7_STATE]<<7;
    
    [req setPostValue:self._phoneTextField.text forKey:@"phoneNum"];
    
    [req setPostValue:self._firstTime.text forKey:@"time1"];
    [req setPostValue:self._secondTime.text forKey:@"time2"];
    [req setPostValue:self._thirdTime.text forKey:@"time3"];
    [req setPostValue:self._forthTime.text forKey:@"time4"];
    
    [req setPostValue:[NSString stringWithFormat:@"%d",days] forKey:@"days"];
    
    [req setPostValue:[NSString stringWithFormat:@"%d",_timeInterval] forKey:@"interval"];
    
    [req setPostValue:[NSString stringWithFormat:@"%d", [self.background isOn]] forKey:@"background"];
    [req setPostValue:[NSString stringWithFormat:@"%d",[self.lowPower isOn]] forKey:@"lowpower"];
    
    [req setPostValue:@"OK" forKey:@"status"];
    
    
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
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end



























