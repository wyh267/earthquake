//
//  UIEarthQuakeViewController.h
//  earthquake
//
//  Created by wu yinghao on 13-7-9.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CEarthQuakeBase.h"


@interface UIEarthQuakeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,
                                                         earthquakeInfoDelegate>
{
    NSString    *base_url;
    
    NSMutableArray *earthquake_info_array;
    
    UITableView *mytableView;
}





-(BOOL)setBaseURL:(NSString *)mbase_url;



@end
