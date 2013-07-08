//
//  CEarthQuakeData.h
//  earthquake
//
//  earthquake informations data struct.
//  Created by wu yinghao on 13-7-8.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CEarthQuakeData : NSObject
{
    NSString    *ref_url;
    NSString    *info;
    NSString    *local;
    float       posionX;
    float       posionY;
    float       level;
    
}



-(id)initWithPosionX:(float)X
             PosionY:(float)Y
              Levels:(float)level
              refURL:(NSString *)refUrl
         Information:(NSString *)information
               Local:(NSString *)loc;



@end
