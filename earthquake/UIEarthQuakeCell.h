//
//  UIEarthQuakeCell.h
//  earthquake
//
//  Created by wu yinghao on 13-7-11.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIEarthQuakeCell : UITableViewCell
{
    UILabel *placeLabel;
    UILabel *magLabel;
    UILabel *deepthLabel;
    
}



@property(nonatomic,retain)IBOutlet UILabel *placeLabel;
@property(nonatomic,retain)IBOutlet UILabel *magLabel;
@property(nonatomic,retain)IBOutlet UILabel *deepthLabel;


@end
