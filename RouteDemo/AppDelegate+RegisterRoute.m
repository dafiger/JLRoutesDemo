//
//  AppDelegate+RegisterRoute.m
//  RouteDemo
//
//  Created by wpf on 2019/3/29.
//  Copyright © 2019 wpf. All rights reserved.
//

#import "AppDelegate+RegisterRoute.h"

//第三方框架
#import "JLRoutes.h"
//#import <JLRoutes/JLRoutes.h>

//跳转界面
#import "FirstVC.h"

@implementation AppDelegate (RegisterRoute)

#pragma mark - 注册URL
#pragma mark Method1全局
- (void)registerRoute{
    __weak typeof(self) weakSelf = self;
    NSLog(@"1------%@", [self valueForKey:@"retainCount"]);
    [[JLRoutes globalRoutes] addRoute:@"/:FirstVC"// /:Action/:Param
                              handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
                                  NSString *controller = parameters[@"FirstVC"];
//                                  NSString *method = parameters[@"Action"];
//                                  NSString *param = parameters[@"Param"];
                                  
//                                  Class class = NSClassFromString(parameters[@"FirstVC"]);
                                  
                                  [weakSelf.window.rootViewController presentViewController:[[NSClassFromString(controller) alloc] init]
                                                                                   animated:YES
                                                                                 completion:^{
                                                                                     NSLog(@"跳转成功");
                                                                                 }];
                                  return YES;
                              }];
    NSLog(@"2------%@", [self valueForKey:@"retainCount"]);
    
    //设置优先级，默认是0
    [[JLRoutes globalRoutes] addRoute:@"/:FirstVC"
                             priority:1
                              handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
                                  return YES;
    }];
    
    //多个目标
    [[JLRoutes globalRoutes] addRoutes:@[@"/:FirstVC", @"/:SecondVC"]
                               handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
                                   return YES;
    }];
    
    [[JLRoutes routesForScheme:@"JLRouteSchemeOne"] addRoute:@"/:FirstVC"
                                                     handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
                                                         return YES;
                                                     }];
    
    [[JLRoutes routesForScheme:@"JLRouteSchemeTwo"] addRoute:@"/:SecondVC"
                                                     handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
                                                         return YES;
                                                     }];
}

#pragma mark Method2自定义
- (void)registerRouteWithScheme:(NSString *)scheme{
    [[JLRoutes routesForScheme:scheme] addRoute:@"/:FirstVC/:Action/:Param"
                                        handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
                                            NSString *controller = parameters[@"FirstVC"];
                                            NSString *method = parameters[@"Action"];
                                            NSString *param = parameters[@"Param"];
                                            
                                            return YES;
                                        }];
    
    [[JLRoutes routesForScheme:@"JLRouteSchemeTwo"] addRoute:@"/:ViewController/:userID/:pass"
                                        handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
                                            NSString *controller = parameters[@"FirstVC"];
                                            NSString *method = parameters[@"Action"];
                                            NSString *param = parameters[@"Param"];
                                            
                                            return YES;
                                        }];
}

#pragma mark - 拦截URL
#pragma mark Method1
- (BOOL)applicationOpenURL:(NSURL *)url{
    return [JLRoutes routeURL:url];// ||
}

#pragma mark Method2
- (BOOL)applicationOpenURL:(NSURL *)url Scheme:(NSString *)scheme{
    if ([scheme isEqualToString:@"jlrouteschemeone"]) {
        return [[JLRoutes routesForScheme:@"JLRouteSchemeOne"] routeURL:url];
    } else if ([scheme isEqualToString:@"jlrouteschemetwo"]) {
        return [[JLRoutes routesForScheme:@"JLRouteSchemeTwo"] routeURL:url];
    }else{
//        return [[JLRoutes routesForScheme:scheme] routeURL:url];
        return [self applicationOpenURL:url];
    }
}

@end
