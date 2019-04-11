//
//  NSString+Tools.m
//  RouteDemo
//
//  Created by wpf on 2019/3/29.
//  Copyright © 2019 wpf. All rights reserved.
//

#import "NSString+Tools.h"
#import <UIKit/UIKit.h>

@implementation NSString (Tools)

+ (void)OpenURLWithStr:(NSString *)urlStr{
    if (urlStr.length==0) {
        return ;
    }
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlStr]]) {
//        if (iOS10_lat) {
//            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr] options:@{} completionHandler:nil];
//        }else{
//            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
//        }
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr] options:@{} completionHandler:nil];
    }
}

+ (NSString *)encodeURLWithStr:(NSString *)urlStr{
    if (urlStr.length==0) {
        return nil;
    }
//    NSString *urlStr_en_old = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *urlStr_en = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    return urlStr_en;
}

+ (NSString *)decodeURLWithStr:(NSString *)urlStr{
    if (urlStr.length==0) {
        return nil;
    }
//    NSString *urlStr_de_old = [urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *urlStr_de = [urlStr stringByRemovingPercentEncoding];
    return urlStr_de;
}

@end
