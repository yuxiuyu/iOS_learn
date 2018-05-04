//
//  AppDelegate.m
//  UIApplication功能熟悉
//
//  Created by jiazhen-mac-01 on 17/6/13.
//  Copyright © 2017年 yxy. All rights reserved.
//


//1、如果有main，就会加载main.storyboard
//2、加载之前创建窗口
//3、把main.storyboard箭头指向的控制器，设为窗口的跟控制器
//4、显示窗口（把窗口的跟控制器的view，添加到窗口）
#import "AppDelegate.h"
#import "testXibViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"%s",__func__);
    
    _window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    UIViewController*vc=[[UIViewController alloc]init];
//    vc.view.backgroundColor=[UIColor redColor];
//    _window.rootViewController=vc;
    
//    NSLog(@"%@",[UIApplication sharedApplication].keyWindow);
//    NSLog(@"%@",_window);
//    [_window makeKeyAndVisible];
//    NSLog(@"%@",_window);
//    NSLog(@"%@",[UIApplication sharedApplication].keyWindow);
//    _window.hidden=NO;
    /*
       makeKeyAndVisible:
       1、设置应用程序的主窗口
       2、让窗口显示 把窗口的hidden＝NO
       3、把窗口的跟控制器的view添加到窗口上
          [self.window addSubView:vc.view];
     */
    
//    从iOS9之后，如果添加了多个窗口，控制器它会自动把状态栏给隐藏掉
//    解决办法，把状态栏给应用程序管理
//    _window1=[[UIWindow alloc]initWithFrame:CGRectMake(0, 0, 376, 40)];
//    UIViewController*vc1=[[UIViewController alloc]init];
//    vc1.view.backgroundColor=[UIColor blueColor];
//    _window1.rootViewController=vc1;
//    _window1.windowLevel=UIWindowLevelStatusBar;
//    [_window1 makeKeyAndVisible];
    
    
    //键盘，状态栏其实都是window
//    UITextField*textField=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, 10, 20)];
//    [textField becomeFirstResponder];
//    //UITextView想要显示键盘，必须得添加到一个view上
//    [vc.view addSubview:textField];
    
    
    //通过storyboard加载
//    UIViewController*mainVC=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"mainVC"];
//       _window.rootViewController=mainVC;
//    _window.hidden=NO;
    
//    通过xib加载
//    1、先判断有没有与当前控制器相同名称的xib，如果有自动加载相同名称的xib
//    2、如果没有相同名称的xib，则加载跟他有相同名称并且去掉controller的xib
    
//    开始创建的控制器颜色是透明的，并不是alpha是透明的
//    1、颜色是透明的，可以处理事件
//    2、aplha＝0，不可以处理事件
    testXibViewController*testVC=[[testXibViewController alloc]init];
    testVC.view.backgroundColor=[UIColor orangeColor];
    _window.rootViewController=testVC;
    [_window makeKeyAndVisible];
    
    
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
