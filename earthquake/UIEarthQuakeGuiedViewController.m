//
//  UIEarthQuakeGuiedViewController.m
//  earthquake
//
//  Created by wu yinghao on 13-7-11.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import "UIEarthQuakeGuiedViewController.h"

@interface UIEarthQuakeGuiedViewController ()

@end

@implementation UIEarthQuakeGuiedViewController


@synthesize guiedWebView;

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
    
    //init webview
    guiedWebView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    
    
    [self.view addSubview:guiedWebView];
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
