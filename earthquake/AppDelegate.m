//
//  AppDelegate.m
//  earthquake
//
//  Created by wu yinghao on 13-6-19.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "MLNavigationController.h"

#import "UMSocial.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //NSMutableArray  *iphoneControllers=[NSMutableArray array];
    //NSArray *itemNames=[[NSArray  alloc] initWithObjects:@"EarthQuake Info",@"Help",@"Setting",nil];
    
    [UMSocialData setAppKey:@"4f5cb21452701554ab00002e"];
   
    
    
    // Override point for customization after application launch.
    //判断是iphone还是ipad设备
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
         
        
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
        self.navCtrl = [[MLNavigationController alloc]initWithRootViewController:self.viewController];
    } else {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
    }
      
    self.window.rootViewController = self.navCtrl;
    //创建UITabBarController，将显示的内容添加进去
    //UITabBarController *bar = [[UITabBarController alloc] init];
    //bar.viewControllers = iphoneControllers;
    //bar.customizableViewControllers = iphoneControllers;
    //[self.window addSubview:bar.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
