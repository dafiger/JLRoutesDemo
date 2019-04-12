//
//  ViewController.m
//  RouteDemo
//
//  Created by wpf on 2019/3/28.
//  Copyright © 2019 wpf. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Tools.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *skipBtn;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(50, 100, 300, 100);
//    btn.backgroundColor = [UIColor orangeColor];
//    [btn setTitle:@"A模块组件" forState: UIControlStateNormal];
//    [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
    
//    [self skipBtn];
//    [self.view addSubview:_skipBtn];
    [self.view addSubview:self.skipBtn];
}

#pragma mark - lazy懒加载
- (UIButton *)skipBtn{
    if (!_skipBtn) {
        _skipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _skipBtn.frame = CGRectMake(50, 100, 300, 100);
        _skipBtn.backgroundColor = [UIColor orangeColor];
        [_skipBtn setTitle:@"测试路由" forState: UIControlStateNormal];
        [_skipBtn addTarget:self
                     action:@selector(buttonAction1:)
           forControlEvents:UIControlEventTouchUpInside];
    }
    return _skipBtn;
}

#pragma mark - 测试路由
- (void)buttonAction1:(id)sender{
    //一个参数
    NSString *customURL = @"wpfroutexx://FirstVC";
    [NSString OpenURLWithStr:customURL];
    
    //多个参数
    NSString *moreParamURL = @"JLRouteSchemeTwo://TwoDetailViewController/我是userID/我是pwd";
    // 中文传输需要进行转义
    moreParamURL = [moreParamURL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:moreParamURL]];
}

@end
