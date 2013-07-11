//
//  UIEarthQuakeShowViewController.h
//  earthquake
//  earthquake show view controller ,display contents of the earthquake information
//  Created by wu yinghao on 13-7-11.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "CEarthQuakeData.h"
#import "CustomAnnotation.h"

@interface UIEarthQuakeShowViewController : UIViewController
<MKMapViewDelegate, CLLocationManagerDelegate> {
    MKMapView           *earthquakeMap;
    
    CLLocationManager   *locationManager;

    UIWebView           *earthquakeInfo;
    
    
    
    CEarthQuakeData     *earthquake_data;
}



-(bool)setEarthQuakeData:(CEarthQuakeData *)earthquakeData;

-(void)createAnnotationWithCoords:(CLLocationCoordinate2D) coords;

@end
