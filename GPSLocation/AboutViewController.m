//
//  AboutViewController.m
//  GPSLocation
//
//  Created by zhuang chaoxiao on 14-10-2.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()
@property (weak, nonatomic) IBOutlet UIView *_infoBgView;
@property (weak, nonatomic) IBOutlet UIButton *_backBtn;
- (IBAction)backClicked;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    //
    [self._backBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    //
    self._infoBgView.layer.cornerRadius = 10;
    
    
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
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
