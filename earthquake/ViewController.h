//
//  ViewController.h
//  earthquake
//
//  Created by wu yinghao on 13-6-19.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UIButton  *bun;
    UIButton  *bun2;
    UIButton  *bun3;
}


@property (nonatomic,retain)IBOutlet UIButton *bun;
@property (nonatomic,retain)IBOutlet UIButton *bun2;
@property (nonatomic,retain)IBOutlet UIButton *bun3;


-(IBAction)pressButton1:(id)sender;
-(IBAction)pressButton2:(id)sender;
-(IBAction)pressButton3:(id)sender;

-(id) initController:(NSString *)str;

@end
