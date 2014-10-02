//
//  ViewController.m
//  GPSLocation
//
//  Created by zhuang chaoxiao on 14-9-25.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "ViewController.h"
#import "DSLocationViewController.h"
#import "SSLocationViewController.h"
#import "DSHistoryViewController.h"

@interface ViewController ()
{
}

@property (weak, nonatomic) IBOutlet UIButton *_SSLocBtn;
@property (weak, nonatomic) IBOutlet UIButton *_DSLocBtn;
@property (weak, nonatomic) IBOutlet UIButton *_palyBackBtn;
@property (weak, nonatomic) IBOutlet UIButton *_settingBtn;

- (IBAction)DSLocationClicked;
- (IBAction)SSLocationClicked:(id)sender;
- (IBAction)DSHistoryClicked;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //
    

    //
    [self layoutBtn];
}


-(void)layoutBtn
{
    self._SSLocBtn.layer.cornerRadius = self._SSLocBtn.bounds.size.width/2;
    self._SSLocBtn.layer.masksToBounds = YES;
    
    
    self._DSLocBtn.layer.cornerRadius = self._SSLocBtn.bounds.size.width/2;
    self._DSLocBtn.layer.masksToBounds = YES;
    
    self._palyBackBtn.layer.cornerRadius = self._SSLocBtn.bounds.size.width/2;
    self._palyBackBtn.layer.masksToBounds = YES;
    
    self._settingBtn.layer.cornerRadius = self._SSLocBtn.bounds.size.width/2;
    self._settingBtn.layer.masksToBounds = YES;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)DSLocationClicked {
    
    DSLocationViewController * vc = [[DSLocationViewController alloc]initWithNibName:@"DSLocationViewController" bundle:nil];
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (IBAction)SSLocationClicked:(id)sender {
    
    SSLocationViewController * vc = [[SSLocationViewController alloc]initWithNibName:nil bundle:nil];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)DSHistoryClicked {
    
    DSHistoryViewController * vc = [[DSHistoryViewController alloc]initWithNibName:nil bundle:nil];
    
    [self presentViewController:vc animated:YES completion:nil];
}
@end
