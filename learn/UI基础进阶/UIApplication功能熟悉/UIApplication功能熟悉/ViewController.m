//
//  ViewController.m
//  UIApplication功能熟悉
//
//  Created by jiazhen-mac-01 on 17/6/13.
//  Copyright © 2017年 yxy. All rights reserved.
//



#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       // Do any additional setup after loading the view, typically from a nib.
}
//设置提醒图标
- (IBAction)noticeIconBtnAction:(id)sender {
    UIApplication*app=[UIApplication sharedApplication];
    //先要注册registerUserNotificationSettings
    UIUserNotificationSettings*set=[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    [app registerUserNotificationSettings:set];
    //然后设置数字
    [app setApplicationIconBadgeNumber:10];
}
//设置联网状态
- (IBAction)wifiStateBtnAction:(id)sender {
    UIApplication*app=[UIApplication sharedApplication];
    [app setNetworkActivityIndicatorVisible:YES];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:5];
        [app setNetworkActivityIndicatorVisible:NO];
    });
}
//设置状态栏
- (IBAction)statusBarBtnAction:(id)sender {
//    1、程序默认都是UIApplication控制的状态栏，通过
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UIApplication sharedApplication] setStatusBarHidden:YES animated:NO];
//    2、 修改为每个页面控制的话 要在plist里添加个字段  倒数第二个
//    View controller-based status bar appearance   改为YES
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
-(BOOL)prefersStatusBarHidden
{
   return NO;
}
//打开网页
- (IBAction)openUrlBtnAction:(id)sender {
    //tel://10086 电话
    //sms://10086 短信
    //mailto://18896591232@163.com邮件
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@""] options:nil completionHandler:^(BOOL success) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
