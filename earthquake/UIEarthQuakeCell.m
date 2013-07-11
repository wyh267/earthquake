//
//  UIEarthQuakeCell.m
//  earthquake
//
//  Created by wu yinghao on 13-7-11.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import "UIEarthQuakeCell.h"

@implementation UIEarthQuakeCell

@synthesize placeLabel,deepthLabel,magLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
