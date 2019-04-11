//
//  NSString+Tools.h
//  RouteDemo
//
//  Created by wpf on 2019/3/29.
//  Copyright © 2019 wpf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Tools)

+ (void)OpenURLWithStr:(NSString *)urlStr;

+ (NSString *)encodeURLWithStr:(NSString *)urlStr;

+ (NSString *)decodeURLWithStr:(NSString *)urlStr;

@end

NS_ASSUME_NONNULL_END
