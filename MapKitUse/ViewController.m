//
//  ViewController.m
//  MapKitUse
//
//  Created by admin on 15/9/25.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#import "ViewController.h"
#import "myAnnotation.h"

@interface ViewController ()<MKMapViewDelegate>
{
    MKMapView *_mapView;
    CLLocationManager *_locMan;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_mapView];
    _locMan = [[CLLocationManager alloc]init];

    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [_locMan requestWhenInUseAuthorization];
    }
       /*
     * MKMapTypeStandard, 标准
     * MKMapTypeSatellite, 卫星
     * MKMapTypeHybrid 混合 （hybrid 混合）
     */
    [_mapView setMapType:MKMapTypeStandard];
    
//    MKUserTrackingModeNone
//    MKUserTrackingModeFollow
//    MKUserTrackingModeFollowWithHeading
    
    myAnnotation *Annotation = [[myAnnotation alloc]init];
    [Annotation setCoordinate:CLLocationCoordinate2DMake(+28.19409000, +112.98227900)];
    [Annotation setTitle:@"长沙"];
    [Annotation setSubtitle:@"我的位置"];
    [Annotation setIconImage:[UIImage imageNamed:@"head0.png"]];
    [_mapView addAnnotation:Annotation];
    
    
    
    [_mapView setUserTrackingMode:MKUserTrackingModeFollow];
    [_mapView setDelegate:self];
}
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 100, 100);
    [_mapView setRegion:region animated:YES];
}
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    //annotation 的重用
    static NSString *myAnno = @"my Annotation";
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:myAnno];
    if (!view) {
        view = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:myAnno];
        [view setCanShowCallout:YES];
    }
    //设置大头针
    [view setAnnotation:annotation];
    //设置图像
    [view setImage:((myAnnotation *)annotation).iconImage];
    
    return view;
}

@end
