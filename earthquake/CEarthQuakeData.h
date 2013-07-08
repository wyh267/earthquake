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
    NSString    *ref_url; //参考网址
    NSString    *info;    //参考描述
    NSString    *local;   //地点
    float       posionX;  //经度
    float       posionY;  //纬度
    float       level;    //级别
    float       deepth;   //深度
    
}



-(id)initWithPosionX:(float)X
             PosionY:(float)Y
              Levels:(float)level
              refURL:(NSString *)refUrl
         Information:(NSString *)information
               Local:(NSString *)loc;



@end
