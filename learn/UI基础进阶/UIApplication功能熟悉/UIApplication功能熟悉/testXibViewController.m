//
//  testXibViewController.m
//  UIApplication功能熟悉
//
//  Created by jiazhen-mac-01 on 17/6/14.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "testXibViewController.h"
#import "testView.h"
@interface testXibViewController ()

@end

@implementation testXibViewController
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"%s",__func__);
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}
//loadView作用，用来创建控制器的view
//什么时候调用：当控制器的view，第一次使用的时候调用

//1、先判断当前控制器是不是从storyboard当中加载的，如果是从storyboard加载的控制器，那它就会从storyboard当中加载的控制器的view，设置为当前控制器的view
//2、当前控制器是不是从xib当中加载的，如果是从xib当中加载的话，把xib当中指定的view，设置为当前控制器的view
//3、如果也不是从xib加载的，他会创建空白的view
// 一旦创建了loadview方法，说明要自己定义view
//一般使用的场景，当控制器的view一显示时就是一张图片，或者UIwebview
//节省内存
-(void)loadView
{
    testView*vv=[[testView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    vv.backgroundColor=[UIColor redColor];
    self.view=vv;
    
}

//当控制器的loadView加载完毕调用
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blueColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
