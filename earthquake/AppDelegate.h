//
//  AppDelegate.h
//  earthquake
//
//  Created by wu yinghao on 13-6-19.
//  Copyright (c) 2013年 wu yinghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class MLNavigationController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (strong, nonatomic) MLNavigationController *navCtrl;

@end
