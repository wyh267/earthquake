//
//  UIEarthQuakeViewController.m
//  earthquake
//
//  Created by wu yinghao on 13-7-9.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import "UIEarthQuakeViewController.h"

#import "CEarthQuakeUS.h"

@interface UIEarthQuakeViewController ()

@end

@implementation UIEarthQuakeViewController

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
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(BOOL)setBaseURL:(NSString *)mbase_url
{
    base_url=[[NSString alloc]initWithString:mbase_url];
    CEarthQuakeUS *us=[[CEarthQuakeUS alloc]initWithUrl:base_url];
    //us.delegate=self;
    [us setDelegate:self];
    [us setContentsUrl:@"kDay45"];
    [us getServerContents];
    return YES;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}





-(void)earthquakeInfoSuccess:(NSMutableArray *)earthquake_info
{
    NSLog(@"Success%@",earthquake_info);
}



@end
