//
//  AppDelegate.h
//  GPSLocation
//
//  Created by zhuang chaoxiao on 14-9-25.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BMapKit.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSArray * _phoneArray;
   // BMKMapManager * _mapManager;
}
@property (strong, nonatomic) UIWindow *window;


-(NSString*)getPhoneInfo:(NSString*)strPhone;
-(void)getPhoneInfo:(NSString*)strPhone withLabel:(UILabel*)lab;


#define SHOW_TIP_YEAR 2014
#define SHOW_TIP_MONTH 10
#define SHOW_TIP_DAY   11

@end

