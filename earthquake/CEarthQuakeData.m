//
//  CEarthQuakeData.m
//  earthquake
//
//  Created by wu yinghao on 13-7-8.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import "CEarthQuakeData.h"

@implementation CEarthQuakeData

@synthesize ref_url,local,info,level,deepth,posionX,posionY;



-(id)initWithPosionX:(float)X
             PosionY:(float)Y
              Levels:(float)lev
              Deepth:(float)Deep
              refURL:(NSString *)refUrl
         Information:(NSString *)information
               Local:(NSString *)loc
{
    self.ref_url=refUrl;//[[NSString alloc]initWithString:refUrl];
    self.local=[[NSString alloc]initWithString:loc];
    self.info=[[NSString alloc]initWithString:information];
    self.level=lev;
    self.deepth=Deep;
    self.posionX=X;
    self.posionY=Y;
    
    
    return self;
    
}







@end
