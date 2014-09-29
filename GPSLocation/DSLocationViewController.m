//
//  DSLocationViewController.m
//  GPSLocation
//
//  Created by zhuang chaoxiao on 14-9-28.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "DSLocationViewController.h"

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


@interface DSLocationViewController ()
{

    int _timeInterval;

}


- (IBAction)dayClicked:(id)sender;

- (IBAction)backClicked;
- (IBAction)lowPowerChanged:(id)sender;
- (IBAction)backgroundChanged:(id)sender;
- (IBAction)intervalClicked:(id)sender;

- (IBAction)saveClicked:(id)sender;



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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
    
}

- (IBAction)backgroundChanged:(id)sender {
    
    UISwitch * sw = (UISwitch*)sender;
    
    BOOL isON = [sw isOn];
    
    NSLog(@"isOn:%d",isON);

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
}

- (IBAction)saveClicked:(id)sender {
    
    
    
}

-(void)hideKeypad
{
    [self._phoneTextField resignFirstResponder];
    
    [self._firstTime resignFirstResponder];
    [self._secondTime resignFirstResponder];
    [self._thirdTime resignFirstResponder];
    [self._forthTime resignFirstResponder];
}

@end
