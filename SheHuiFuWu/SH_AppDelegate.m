//
//  SH_AppDelegate.m
//  SheHuiFuWu
//
//  Created by lipeng11 on 13-6-3.
//  Copyright (c) 2013年 shehuifuwu. All rights reserved.
//

#import "SH_AppDelegate.h"
#import "SH_StartCtro.h"

@interface SH_AppDelegate () <BMKGeneralDelegate>

@property(nonatomic, retain) BMKMapManager *mapManager;

@end

@implementation SH_AppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

//获得app delegate
+ (SH_AppDelegate *)appDelegate
{
    return (SH_AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // 要使用百度地图，请先启动BaiduMapManager
	BMKMapManager *mapManager = [[BMKMapManager alloc]init];
    self.mapManager = mapManager;
    [mapManager release];
	BOOL ret = [_mapManager start:@"F4FE5A4C37FA5DF853C43FC575557AC2D38CCD69" generalDelegate:self];
	if (!ret) {
		NSLog(@"manager start failed!");
	}
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[[SH_StartCtro alloc] init] autorelease];
    } else {
//        self.viewController = [[[SH_ViewController alloc] initWithNibName:@"SH_ViewController_iPad" bundle:nil] autorelease];
    }
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    
    return [TencentOAuth HandleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [TencentOAuth HandleOpenURL:url];
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

#pragma mark-
#pragma BMKGeneralDelegate

/**
 *返回网络错误
 *@param iError 错误号
 */
- (void)onGetNetworkState:(int)iError
{
    
}

/**
 *返回授权验证错误
 *@param iError 错误号 : BMKErrorPermissionCheckFailure 验证失败
 */
- (void)onGetPermissionState:(int)iError
{
    
}

@end
