//
//  ViewController.m
//  earthquake
//
//  Created by wu yinghao on 13-6-19.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import "ViewController.h"



//for test
#import "CEarthQuakeUS.h"

@interface ViewController ()

@end

@implementation ViewController


@synthesize bun,bun2;


-(id) initController:(NSString *)str
{
    
    self = [super init];
    if(self)
    {
        //每次点击新的标签，将显示内容值赋给showString
        //showString = str;
    }
    return self;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title=@"EarthQuake Infomation";
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)pressButton1:(id)sender
{
     ViewController *vc = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(IBAction)pressButton2:(id)sender
{
    CEarthQuakeUS *us=[[CEarthQuakeUS alloc]initWithUrl:@"http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary"];
    [us setContentsUrl:@"kDay45"];
    [us getServerContents];
}

@end
