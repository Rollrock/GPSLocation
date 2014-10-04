//
//  DSHistoryViewController.m
//  GPSLocation
//
//  Created by zhuang chaoxiao on 14-10-2.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "DSHistoryViewController.h"
#import "HistoryViewController.h"

@interface DSHistoryViewController ()


@property (weak, nonatomic) IBOutlet UITextField *_phoneTextField;
@property (weak, nonatomic) IBOutlet UIButton *_backBtn;

@property (weak, nonatomic) IBOutlet UIButton *_history1Btn;
@property (weak, nonatomic) IBOutlet UIButton *_history2Btn;
@property (weak, nonatomic) IBOutlet UIButton *_history3Btn;

- (IBAction)backClicked;


- (IBAction)_history1Clicked:(id)sender;

- (IBAction)_history2Clicked:(id)sender;

- (IBAction)_history3Clicked:(id)sender;


@end



@implementation DSHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self._backBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    self._backBtn.layer.cornerRadius = self._backBtn.frame.size.width/2;
    
    //////
    
    self._history1Btn.layer.cornerRadius = 8;
    self._history2Btn.layer.cornerRadius = 8;
    self._history3Btn.layer.cornerRadius = 8;
    
    //
    
    UITapGestureRecognizer * g = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:g];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)backClicked {
    
    [self hideKeyboard];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)_history1Clicked:(id)sender {
    
    [self hideKeyboard];
    
    HistoryViewController * vc = [[HistoryViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)_history2Clicked:(id)sender {
    
    [self hideKeyboard];
}

- (IBAction)_history3Clicked:(id)sender {
    
    [self hideKeyboard];
}


-(void)hideKeyboard
{
    [self._phoneTextField resignFirstResponder];
}



@end



















