//
//  SH_AppDelegate.h
//  SheHuiFuWu
//
//  Created by lipeng11 on 13-6-3.
//  Copyright (c) 2013年 shehuifuwu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SH_StartCtro;

@interface SH_AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SH_StartCtro *viewController;

+ (SH_AppDelegate *)appDelegate;

@end
