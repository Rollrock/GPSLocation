//
//  HistoryViewController.m
//  GPSLocation
//
//  Created by zhuang chaoxiao on 14-10-2.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "HistoryViewController.h"
#import "BMKMapView.h"
#import "BMKPointAnnotation.h"
#import "BMKPolyline.h"
#import "BMKPolylineView.h"

@interface HistoryViewController ()<BMKMapViewDelegate>
{
    BMKMapView * _mapView;
    NSMutableArray * _array;
    BMKPolyline *_polyline;
}
@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self layoutMapView];
    
    [self layoutBack];
    
    self.view.backgroundColor = [UIColor grayColor];
}

-(void)layoutAnns
{
    _array = nil;
    _array = [[NSMutableArray alloc]initWithCapacity:1];
    
    //
    CLLocationCoordinate2D location;
    
    CLLocationCoordinate2D coors[5] = {0};

    {
        location.latitude = 31.2011;
        location.longitude = 121.6332;
        
        coors[0].latitude = 31.2011;
        coors[0].longitude = 121.6332;
        
        BMKPointAnnotation *ann = [[BMKPointAnnotation alloc]init];
        ann.coordinate = location;
        ann.title = @"2014.10.22-22:45";
        ann.subtitle = @"上海市浦东新区张东路2281弄";
        
        [_array addObject:ann];
    }
    
    {
        location.latitude = 31.2061;
        location.longitude = 121.6432;
        
        coors[1].latitude = 31.2061;
        coors[1].longitude = 121.6432;
        
        BMKPointAnnotation *ann = [[BMKPointAnnotation alloc]init];
        ann.coordinate = location;
        ann.title = @"2014.10.22-22:45";
        ann.subtitle = @"上海市浦东新区张东路2281弄";
        
        [_array addObject:ann];
    }
    
    {
        location.latitude = 31.2081;
        location.longitude = 121.6382;
        
        coors[2].latitude = 31.2081;
        coors[2].longitude = 121.6382;
        
        BMKPointAnnotation *ann = [[BMKPointAnnotation alloc]init];
        ann.coordinate = location;
        ann.title = @"2014.10.22-22:45";
        ann.subtitle = @"上海市浦东新区张东路2281弄";
        
        [_array addObject:ann];
    }
    
    {
        location.latitude = 31.2101;
        location.longitude = 121.6432;
        
        coors[3].latitude = 31.2101;
        coors[3].longitude = 121.6432;
        
        BMKPointAnnotation *ann = [[BMKPointAnnotation alloc]init];
        ann.coordinate = location;
        ann.title = @"2014.10.22-22:45";
        ann.subtitle = @"上海市浦东新区张东路2281弄";
        
        [_array addObject:ann];
    }
    
    {
        location.latitude = 31.2121;
        location.longitude = 121.6422;
        
        coors[4].latitude = 31.2121;
        coors[4].longitude = 121.6422;
        
        BMKPointAnnotation *ann = [[BMKPointAnnotation alloc]init];
        ann.coordinate = location;
        ann.title = @"2014.10.22-22:45";
        ann.subtitle = @"上海市浦东新区张东路2281弄";
        
        [_array addObject:ann];
    }
   
    
    [_mapView addAnnotations:_array];
    [_mapView selectAnnotation:[_array firstObject] animated:YES];
    
    
    _polyline = [BMKPolyline polylineWithCoordinates:coors count:5];
    [_mapView addOverlay:_polyline];
}



//根据overlay生成对应的View
- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id <BMKOverlay>)overlay
{
    
    if ([overlay isKindOfClass:[BMKPolyline class]])
    {
        BMKPolylineView* polylineView = [[BMKPolylineView alloc] initWithOverlay:overlay];
        polylineView.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:1];
        polylineView.lineWidth = 3.0;
        return polylineView;
    }
    
    return nil;
}



-(void)layoutMapView
{
    CGRect rect = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height - 0);

    _mapView = [[BMKMapView alloc]initWithFrame:rect];
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
    
    
    [self moveMapAndAddAnnotations];
}


-(void)moveMapAndAddAnnotations
{
    CLLocationCoordinate2D location;
    location.latitude = 31.2011;
    location.longitude = 121.6332;
    
    [_mapView setCenterCoordinate:location animated:YES];
    
    [self layoutAnns];
    
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
    [self dismissViewControllerAnimated:YES completion:nil];
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

@end
