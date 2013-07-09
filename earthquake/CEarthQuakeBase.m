//
//  CEarthQuakeBase.m
//  earthquake
//
//  Created by wu yinghao on 13-7-8.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import "CEarthQuakeBase.h"

@implementation CEarthQuakeBase



//
//初始化，输入参数是服务器地址
//
-(id)initWithUrl:(NSString *)url
{
    self=[super init];
    if (self) {
        server_base_url=[[NSString alloc]initWithString:url];
    }
    
    return self;
    
}


//
//获取服务器页面的内容
//
-(bool)getServerContents
{
    
    return YES;
}


//
//
//返回数据列表的内容
//参数: 列表的索引
//返回: CEarthQuakeData实例
//
//
-(CEarthQuakeData *)getDataWithIndex:(NSInteger)index
{
    if ([earth_quake_data_array count]>0) {
        
        return [earth_quake_data_array objectAtIndex:index];
    }else{
        return nil;
    }
}



//
//解析服务器页面内容，此方法由子类继承并实现
//
-(bool)parseContents
{
    return YES;
}







@end
