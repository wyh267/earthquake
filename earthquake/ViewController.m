//
//  ViewController.m
//  earthquake
//
//  Created by wu yinghao on 13-6-19.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



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



@end
