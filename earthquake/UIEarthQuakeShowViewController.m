//
//  UIEarthQuakeShowViewController.m
//  earthquake
//
//  Created by wu yinghao on 13-7-11.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import "UIEarthQuakeShowViewController.h"

@interface UIEarthQuakeShowViewController ()

@end

@implementation UIEarthQuakeShowViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    earthquakeMap = [[MKMapView alloc] initWithFrame:CGRectMake(5, 5, 310, 200)];
    earthquakeMap.showsUserLocation = YES;
    earthquakeMap.mapType = MKMapTypeStandard;
    
    
    earthquakeInfo=[[UIWebView alloc]initWithFrame:CGRectMake(5, 210, 310, 280)];
    
    self.title=@"Detail";
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    [self.view addSubview:earthquakeInfo];
    [self.view addSubview:earthquakeMap];
    /*CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(39.915352,116.397105);
    
    float zoomLevel = 0.02;
    MKCoordinateRegion region = MKCoordinateRegionMake(coords, MKCoordinateSpanMake(zoomLevel, zoomLevel));
    [earthquakeMap setRegion:[earthquakeMap regionThatFits:region] animated:YES];
    */
    
    
    
    CLLocationCoordinate2D coords = CLLocationCoordinate2DMake((CLLocationDegrees)earthquake_data.posionY, (CLLocationDegrees)earthquake_data.posionX);
    
    float zoomLevel = 0.02;
    MKCoordinateRegion region = MKCoordinateRegionMake(coords, MKCoordinateSpanMake(zoomLevel, zoomLevel));
    [earthquakeMap setRegion:[earthquakeMap regionThatFits:region] animated:YES];
    
    
    [self createAnnotationWithCoords:coords];
    
    
    [earthquakeInfo loadHTMLString:@"<html><head></head><body>Hello</body></html>" baseURL:nil];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(bool)setEarthQuakeData:(CEarthQuakeData *)earthquakeData
{
    
    earthquake_data=earthquakeData;
    
    return YES;
}




-(void)createAnnotationWithCoords:(CLLocationCoordinate2D) coords {
    CustomAnnotation *annotation = [[CustomAnnotation alloc] initWithCoordinate:
                                    coords];
    annotation.title = earthquake_data.local;
    annotation.subtitle = [[NSString alloc]initWithFormat:@"Level : %.2f",earthquake_data.level];
    [earthquakeMap addAnnotation:annotation];
}





@end
