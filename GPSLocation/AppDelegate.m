//
//  AppDelegate.m
//  GPSLocation
//
//  Created by zhuang chaoxiao on 14-9-25.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



-(void)initPhoneInfo
{
    NSString * path = [[[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/"] stringByAppendingString:@"Mobile.txt"];
    NSString * strTemp = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    _phoneArray = [strTemp componentsSeparatedByString:@"\n"];

}

-(void)getPhoneInfo:(NSString*)strPhone withLabel:(UILabel*)lab
{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^(void){
        
        if( [strPhone length] == 7 )
        {
            for( NSString * str in _phoneArray )
            {
                NSString * strFind = [strPhone substringWithRange:NSMakeRange(0, 7)];
                
                NSString * strCmp = [str substringWithRange:NSMakeRange(0, 7)];
                
                if( NSOrderedSame == [strFind compare:strCmp] )
                {
                    NSString * strOut = [str substringFromIndex:8];
                    
                    dispatch_async(dispatch_get_main_queue(), ^(void){
                       
                        lab.text = strOut;
                    });
                    
                    
                    break;
                }
            }
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                
                lab.text = @"请确认输入的号码是否正确!";
            });
        }
        
    });
    
}

-(NSString*)getPhoneInfo:(NSString*)strPhone
{
    //
    
    __block NSString * strRet;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^(void){
        
        if( [strPhone length] == 7 )
        {
            for( NSString * str in _phoneArray )
            {
                NSString * strFind = [strPhone substringWithRange:NSMakeRange(0, 7)];
                
                NSString * strCmp = [str substringWithRange:NSMakeRange(0, 7)];
                
                if( NSOrderedSame == [strFind compare:strCmp] )
                {
                    NSString * strOut = [str substringFromIndex:8];
                    strRet =   strOut;
                    break;
                }
            }
        }
        
        strRet =   @"请确认输入的号码是否正确!";
        
    });
    
    return strRet;
    
    /*
    if( [strPhone length] == 7 )
    {
        for( NSString * str in _phoneArray )
        {
            NSString * strFind = [strPhone substringWithRange:NSMakeRange(0, 7)];
            
            NSString * strCmp = [str substringWithRange:NSMakeRange(0, 7)];
            
            if( NSOrderedSame == [strFind compare:strCmp] )
            {
                NSString * strOut = [str substringFromIndex:8];
                return  strOut;
            }
        }
    }
    
    return  @"请确认输入的号码是否正确!";
     
     */
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [self initPhoneInfo];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
