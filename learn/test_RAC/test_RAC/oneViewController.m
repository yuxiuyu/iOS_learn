//
//  yxyViewController.m
//  test_RAC
//
//  Created by jiazhen-mac-01 on 17/3/9.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "oneViewController.h"
#import "twoViewController.h"
@import ReactiveCocoa;
@interface oneViewController ()

@end

@implementation oneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //// RACSignal
    RACSignal*signal=[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"success"];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"destroy");
        }];
    }];
    [signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    ///RACSubject
    RACSubject*subject=[RACSubject subject];
    [subject subscribeNext:^(id x) {
        NSLog(@"我是第一个订阅者");
    }];
    [subject subscribeNext:^(id x) {
        NSLog(@"我是第二个订阅者");
    }];
     [subject sendNext:@(1)];
     [subject sendNext:@(2)];
    ////RACReplaySubject
    RACReplaySubject*replaySubject=[RACReplaySubject subject];
    
    [replaySubject subscribeNext:^(id x) {
        NSLog(@"第一个订阅者接收到的数据%@",x);
    }];
    [replaySubject subscribeNext:^(id x) {
        NSLog(@"第二个订阅者收到的数据%@",x);
    }];
    [replaySubject sendNext:@(1)];
    [replaySubject sendNext:@(2)];
    ////RACSequence和RACTuple简单使用
     // 1.遍历数组
    NSArray*numbers=@[@1,@2,@3];
    [numbers.rac_sequence.signal subscribeNext:^(NSString* x) {
        if ([x intValue]%2==0) {
            NSLog(@"%@",x );
        }
    }];
     // 2.遍历字典,遍历出来的键值对会包装成RACTuple(元组对象)
    NSDictionary*dic=@{@"name":@"yxy",@"age":@12};
    [dic.rac_sequence.signal subscribeNext:^(id x) {
        NSString*s= x[0];
        NSString*ss=x[1];
        NSLog(@"%@  %@",s,ss);
    }];
    // 3.字典转模型
    // 3.1 OC写法
//    NSString*filePath=[[NSBundle mainBundle] pathForResource:@"yyy.plist" ofType:nil];
//    NSArray*array=[NSArray arrayWithContentsOfFile:filePath];
//    array.rac_sequence.signal map:^id(id value) {
//        return <#expression#>
//    }
//    NSLog(@"array  +++++%@",array);
    //RACCommand简单使用
    __block int aa=10;
    UIButton*btn=[UIButton buttonWithType:UIButtonTypeCustom];
    RACCommand*command=[[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        NSLog(@"我点击了按钮");
        aa+=5;
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            NSLog(@"pass data");
            [subscriber sendNext:@(aa)];
            [subscriber sendCompleted];
            return [RACDisposable disposableWithBlock:^{
                
            }];
        }];
    }];
    btn.rac_command=command;
    [btn.rac_command.executionSignals subscribeNext:^(id x) {
        [x subscribeNext:^(id x) {
             NSLog(@"%@",x);
        }];
       
    }];
    [btn.rac_command.executionSignals subscribeNext:^(id x) {
        [x subscribeNext:^(id x) {
            NSLog(@"%@",x);
        }];
        
    }];
    // RAC高级用法
    // switchToLatest:用于signal of signals，获取signal of signals发出的最新信号,也就是可以直接拿到RACCommand中的信号
    [btn.rac_command.executionSignals.switchToLatest subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    [[btn.rac_command.executing skip:1] subscribeNext:^(id x) {
        if ([x boolValue] == YES) {
            // 正在执行
            NSLog(@"正在执行");
            
        }else{
            // 执行完成
            NSLog(@"执行完成");
        }
    }];
    [btn.rac_command execute:@2];
    
    [btn setTitle:@"click me" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setBounds:CGRectMake(100, 200, 100, 100)];
    [btn setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
    [self.view addSubview:btn];
    
    
    
   
    
    // Do any additional setup after loading the view.
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

- (IBAction)jumpBtnAction:(id)sender {
    twoViewController*twoVC=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"twoViewController"];
    twoVC.subject=[RACSubject subject];
    [twoVC.subject subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    [self.navigationController pushViewController:twoVC animated:YES];
}
@end
