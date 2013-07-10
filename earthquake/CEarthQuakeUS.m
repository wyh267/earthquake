//
//  CEarthQuakeUS.m
//  earthquake
//
//  Created by wu yinghao on 13-7-9.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import "CEarthQuakeUS.h"
#import "AFNetworking.h"

@implementation CEarthQuakeUS




//
//初始化，输入参数是服务器地址
//
-(id)initWithUrl:(NSString *)url
{
    self=[super initWithUrl:url];
    if(self)
    {
        us_earthquake_code=[[NSDictionary alloc]initWithObjects:[[NSArray alloc] initWithObjects:
                            @"/4.5_day.geojson",
                            @"/2.0_day.geojson",
                            @"/1.0_day.geojson",
                            @"/all_day.geojson",nil]
                                                        forKeys:[[NSArray alloc]
            initWithObjects:@"kDay45",
                            @"kDay20",
                            @"kDay10",
                            @"kDay0", nil]];
        
    }
    
    return self;

    
}



//
//设置具体页面
//
-(bool)setContentsUrl:(NSString *)urlKey
{
    
    server_url=[[NSString alloc]initWithFormat:@"%@%@",server_base_url,[us_earthquake_code objectForKey:urlKey]];
    
    return YES;
    
}



//
//获取服务器页面的内容
//
-(bool)getServerContents
{
    NSURL *url = [NSURL URLWithString:server_url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    

    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request

                                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                        us_earthquake_data  = (NSDictionary *)JSON;
                                                        //NSLog(@"%@",us_earthquake_data);
                                                        [self parseContents];
                                                        
                                                    }

                                                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error to Get Contents"
                                                                                                     message:[NSString stringWithFormat:@"%@",error]
                                                                                                    delegate:nil
                                                                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                        [av show];
                                                    }];
    
 
    [operation start];
    NSLog(@"Download contents now,please wait....");
    
    return YES;
    
}



//
//解析服务器页面内容，此方法由子类继承并实现
//
-(bool)parseContents
{
    NSLog(@"Parse contents now....");
    
    NSLog(@"type:%@",[us_earthquake_data objectForKey:@"type"]);
    
    NSLog(@"title:%@",[[us_earthquake_data objectForKey:@"metadata"] objectForKey:@"title"]);
    
    NSArray *featuresArray=[[NSArray alloc]initWithArray:[us_earthquake_data objectForKey:@"features"]];
    
    for (int i =0; i < [featuresArray count]; i++) {
        NSArray *point=[[NSArray alloc]initWithArray:[[[featuresArray objectAtIndex:i]
                                                       objectForKey:@"geometry"]
                                                      objectForKey:@"coordinates"]];
        
        //NSLog(@"type:%@",[[featuresArray objectAtIndex:i] objectForKey:@"type"]);
        //NSLog(@"properties:%@",[[featuresArray objectAtIndex:i] objectForKey:@"properties"]);
        NSLog(@"longitude:%@ latitude:%@ depth:%@",[point objectAtIndex:0],
                                                    [point objectAtIndex:1],
                                                    [point objectAtIndex:2]);
        NSLog(@"place:%@",[[[featuresArray objectAtIndex:i] objectForKey:@"properties"] objectForKey:@"place"]);
        NSLog(@"time:%@",[[[featuresArray objectAtIndex:i] objectForKey:@"properties"] objectForKey:@"time"]);
        NSLog(@"mag:%@",[[[featuresArray objectAtIndex:i] objectForKey:@"properties"] objectForKey:@"mag"]);
    }

    //NSLog(@"features:%@",[us_earthquake_data objectForKey:@"features"]);
    
    
    NSMutableArray *test=[[NSMutableArray alloc]initWithObjects:@"Success",@"Success2",@"Success3", nil];
    
    [self.delegate earthquakeInfoSuccess:test];
    
    return YES;
    
}




@end
