//
//  AppDelegate.m
//  RouteDemo
//
//  Created by wpf on 2019/3/28.
//  Copyright © 2019 wpf. All rights reserved.
//  https://www.jianshu.com/p/109425367a90

#import "AppDelegate.h"
#import "AppDelegate+RegisterRoute.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //注册路由
    [self registerRoute];
    return YES;
}

#pragma mark - 拦截url
- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
//    NSLog(@"1从哪个app跳转而来 Bundle ID: %@", options);
//    NSLog(@"URL:%@, Scheme:%@", url, [url scheme]);
//    return YES;
    
    NSLog(@"Calling Application Bundle ID: %@", options);
    NSLog(@"URL scheme: %@", [url scheme]);
    NSLog(@"URL query: %@", [url query]);
    
    NSString *urlSchemeStr = [[url scheme] lowercaseString]; // url scheme 转换为小写的字符串
    NSLog(@"urlSchemeStr: %@",urlSchemeStr);
    
    return [self applicationOpenURL:url Scheme:urlSchemeStr];
}

//- (BOOL)application:(UIApplication*)application
//            openURL:(NSURL*)url
//  sourceApplication:(NSString*)sourceApplication
//         annotation:(id)annotation {
//    NSLog(@"2从哪个app跳转而来 Bundle ID: %@", sourceApplication);
//    NSLog(@"URL scheme:%@", [url scheme]);
//    return YES;
//}

#pragma mark - 外部web打开的地址跳转
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray<id<UIUserActivityRestoring>> * __nullable restorableObjects))restorationHandler{
    if ([userActivity.activityType isEqualToString:NSUserActivityTypeBrowsingWeb]) {
//        NSURL *webpageURL = userActivity.webpageURL;
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
