//
//  AppDelegate+RegisterRoute.h
//  RouteDemo
//
//  Created by wpf on 2019/3/29.
//  Copyright © 2019 wpf. All rights reserved.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (RegisterRoute)

#pragma mark - 注册URL
#pragma mark Method1
- (void)registerRoute;
#pragma mark Method2
- (void)registerRouteWithScheme:(NSString *)scheme;

#pragma mark - 拦截URL
- (BOOL)applicationOpenURL:(NSURL *)url;
- (BOOL)applicationOpenURL:(NSURL *)url Scheme:(NSString *)scheme;

@end

NS_ASSUME_NONNULL_END
