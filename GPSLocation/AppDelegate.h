//
//  AppDelegate.h
//  GPSLocation
//
//  Created by zhuang chaoxiao on 14-9-25.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSArray * _phoneArray;
}
@property (strong, nonatomic) UIWindow *window;




-(NSString*)getPhoneInfo:(NSString*)strPhone;
-(void)getPhoneInfo:(NSString*)strPhone withLabel:(UILabel*)lab;

@end

