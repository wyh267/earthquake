//
//  UIEarthQuakeShowViewController.m
//  earthquake
//
//  Created by wu yinghao on 13-7-11.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import "UIEarthQuakeShowViewController.h"
#import "UMSocial.h"

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
    
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareMe)];
    
    self.navigationItem.rightBarButtonItem = shareButton;
    
    [self.view setBackgroundColor:[UIColor grayColor]];
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
    
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"earthinfo" ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [earthquakeInfo loadHTMLString:[[NSString alloc]initWithFormat:htmlString,
                                    earthquake_data.local,
                                    earthquake_data.level,
                                    earthquake_data.deepth,
                                    earthquake_data.posionY,
                                    earthquake_data.posionX,
                                    earthquake_data.local,
                                    earthquake_data.local] baseURL:[NSURL URLWithString:filePath]];

    
    
    
    
    //[earthquakeInfo loadHTMLString:@"<html><head></head><body>Hello</body></html>" baseURL:nil];
    
    
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



-(void)shareMe
{
    
    NSString *shareText=[[NSString alloc]initWithFormat:@"%@ !!Level:@.2f Deepth:%.2f!! -- share by earthquakeInfo",earthquake_data.local,earthquake_data.level,earthquake_data.deepth];
    
    
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"4f5cb21452701554ab00002e"
                                      shareText:shareText
                                     shareImage:[UIImage imageNamed:@"icon.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToQzone,UMShareToDouban,UMShareToWechatTimeline,UMShareToEmail,UMShareToSms,UMShareToFacebook,UMShareToTwitter,nil]
                                       delegate:nil];
}



@end
