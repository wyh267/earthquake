//
//  UIEarthQuakeViewController.m
//  earthquake
//
//  Created by wu yinghao on 13-7-9.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import "UIEarthQuakeViewController.h"
#import "UIEarthQuakeCell.h"

#import "CEarthQuakeUS.h"
#import "CEarthQuakeData.h"

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
    
    earthquake_info_array=[[NSMutableArray alloc]init];
    
    mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    mytableView.delegate = self;
    mytableView.dataSource = self;
    [self.view addSubview:mytableView];
    
    
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
    return [earthquake_info_array count];
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CustomCellIdentifier = @"CustomCellIdentifier";
    
    static BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"EarthQuakeCellNib" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CustomCellIdentifier];
        nibsRegistered = YES;
    }
    
    UIEarthQuakeCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    
    
    NSUInteger row = [indexPath row];
    CEarthQuakeData *rowData = [earthquake_info_array objectAtIndex:row];
    
    //cell.magLabel.text = [[NSString alloc] initWithFormat:@"%f",rowData.level];
    //cell.placeLabel.text = rowData.local;
    //cell.deepthLabel.text = [[NSString alloc] initWithFormat:@"%f",rowData.deepth];
    //cell.image = [imageList objectAtIndex:row];
    
    return cell;
    
    
    
    
}

-(void)earthquakeInfoSuccess:(NSMutableArray *)earthquake_info
{
    NSLog(@"Success%@",earthquake_info);
    earthquake_info_array=earthquake_info;
    [mytableView reloadData];
}



@end
