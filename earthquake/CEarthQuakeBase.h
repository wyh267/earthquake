//
//  CEarthQuakeBase.h
//  earthquake
//  earthquake adminstrator base class
//  获取服务器端的地震信息的基类
//  Created by wu yinghao on 13-7-8.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CEarthQuakeData.h"



//回调接口说明
@protocol earthquakeInfoDelegate
@optional

//返回数据
-(void)earthquakeInfoSuccess:(NSMutableArray *)earthquake_info;

//返回错误码和错误字符串
-(void)earthquakeInfoError:(NSString *)error;

@end




@interface CEarthQuakeBase : NSObject
{
    //用以填充的数据内容列表
    NSMutableArray *earth_quake_data_array;
    
    //基础网址
    NSString        *server_base_url;
    
    //最终网址
    NSString        *server_url;
    
    //页面内容
    NSString        *contents;
    
    id<earthquakeInfoDelegate> delegate;
    
}

@property(assign)id<earthquakeInfoDelegate>   delegate;

//
//初始化，输入参数是服务器地址
//
-(id)initWithUrl:(NSString *)url;


//
//获取服务器页面的内容
//
-(bool)getServerContents;


//
//
//返回数据列表的内容
//参数: 列表的索引
//返回: CEarthQuakeData实例
//
//
-(CEarthQuakeData *)getDataWithIndex:(NSInteger)index;



//
//解析服务器页面内容，此方法由子类继承并实现
//
-(bool)parseContents;







@end
