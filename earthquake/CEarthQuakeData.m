//
//  CEarthQuakeData.m
//  earthquake
//
//  Created by wu yinghao on 13-7-8.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import "CEarthQuakeData.h"

@implementation CEarthQuakeData




-(id)initWithPosionX:(float)X
             PosionY:(float)Y
              Levels:(float)lev
              refURL:(NSString *)refUrl
         Information:(NSString *)information
               Local:(NSString *)loc
{
    ref_url=[[NSString alloc]initWithString:refUrl];
    local=[[NSString alloc]initWithString:loc];
    info=[[NSString alloc]initWithString:information];
    level=lev;
    posionX=X;
    posionY=Y;
    
    
    return self;
    
}







@end
