//
//  CEarthQuakeUS.h
//  earthquake
//
//  USA earthquake administrion class
//  Created by wu yinghao on 13-7-9.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import "CEarthQuakeBase.h"



typedef enum {
    kDay45,
    kDay20,
    kDay10,
    kDay0,
    kWeek45,
    kWeek20,
    kWeek10,
    kWeek0,
    kMoth45,
    kMoth20,
    kMoth10,
    kMoth0
    
}USCode;


@interface CEarthQuakeUS : CEarthQuakeBase
{
    NSDictionary    *us_earthquake_code;
    NSDictionary    *us_earthquake_data;
    //USCode  us_earthquake_code;
    
}


//
//初始化，输入参数是服务器地址
//
-(id)initWithUrl:(NSString *)url;



//
//设置具体页面
//
-(bool)setContentsUrl:(NSString *)urlKey;


//
//获取服务器页面的内容
//
-(bool)getServerContents;



//
//解析服务器页面内容，此方法由子类继承并实现
//
-(bool)parseContents;







@end
