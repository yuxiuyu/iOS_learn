//
//  blockViewController.m
//  test_NSThread
//
//  Created by jiazhen-mac-01 on 17/2/9.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "blockViewController.h"

@interface blockViewController ()

@end

@implementation blockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    emptyBlock();
    sumBlock(3,4);
    NSLog(@"%@",logBlock(@"yu",@"xiu"));
    self.backgroundColor([UIColor redColor]);
   
    // Do any additional setup after loading the view.
}
//无参数无返回值的Block
void(^emptyBlock)()=^()
{
    NSLog(@"我是空的block");
};
//有参数无返回值的Block
void(^sumBlock)(int,int)=^(int a,int b)
{
    NSLog(@"%d",a+b);
};
NSString*(^logBlock)(NSString*,NSString*)=^(NSString*a,NSString*b)
{
    return [NSString stringWithFormat:@"%@-%@",a,b];
};

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
