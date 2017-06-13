//
//  ViewController.m
//  test_NSThread
//
//  Created by jiazhen-mac-01 on 17/2/9.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "ViewController.h"
#import "ticketSales.h"
#import "blockViewController.h"
#import "stackViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton*btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(100, 50, 100, 30);
    [btn setTitle:@"NSThread" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(cklikThread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    btn.frame=CGRectMake(100, 200, 100, 30);
    [btn setTitle:@"GCD" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickGCD) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton*btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame=CGRectMake(100, 300, 100, 30);
    [btn1 setTitle:@"BLOCK" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(clickBlock) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    
    UIButton*btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame=CGRectMake(100, 400, 100, 30);
    [btn2 setTitle:@"StackView" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(clickStackView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)cklikThread
{
    ticketSales*sale=[[ticketSales alloc]init];
    [sale startSaleTicket];
    //    NSLog(@"我是主线程！！！");
    //    //1
    //    NSThread*thread1=[[NSThread alloc]initWithTarget:self selector:@selector(run_thread) object:nil];
    //    [thread1 setName:@"thread_one"];
    //    [thread1 setThreadPriority:0.5];
    //    [thread1 start];
    //
    //
    //    NSThread*thread2=[[NSThread alloc]initWithTarget:self selector:@selector(run_thread) object:nil];
    //    [thread2 setName:@"thread_two"];
    //    [thread2 setThreadPriority:1.0];
    //    [thread2 start];
    
    //2
    //    [NSThread detachNewThreadSelector:@selector(run_thread) toTarget:self withObject:nil];
    //3
    //    [self performSelectorInBackground:@selector(run_thread) withObject:nil];
    
}
-(void)run_thread
{
    NSLog(@"我是子线程！！！");
    for (int i=1; i<=10; i++)
    {
        NSLog(@"%d  %@",i,[NSThread currentThread].name);
    }
    [self performSelectorOnMainThread:@selector(backMain) withObject:self waitUntilDone:YES];
}
-(void)backMain
{
    NSLog(@"我是主线程！！！");
}
#pragma mark--GCD test
-(void)clickGCD
{
    NSLog(@"start task 1");
    //    dispatch_async(dispatch_get_global_queue(0, 0), ^{
    //        NSLog(@"start task 1");
    //        [NSThread sleepForTimeInterval:3];
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            NSLog(@"end start");
    //        });
    //    });
    //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
    //        NSLog(@"start task 1");
    //        [NSThread sleepForTimeInterval:3];
    //        NSLog(@"end task 1");
    //    });
    //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
    //        NSLog(@"start task 2");
    //        [NSThread sleepForTimeInterval:3];
    //        NSLog(@"end task 2");
    //    });
    //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    //        NSLog(@"start task 3");
    //        [NSThread sleepForTimeInterval:3];
    //        NSLog(@"end task 3");
    //    });
    //    dispatch_queue_t queue=dispatch_queue_create("com.queuq.test", DISPATCH_QUEUE_CONCURRENT);
    //    dispatch_async(queue, ^{
    //        NSLog(@"start task 1");
    //        [NSThread sleepForTimeInterval:3];
    //        NSLog(@"end task 1");
    //    });
    //    dispatch_async(queue, ^{
    //        NSLog(@"start task 2");
    //        [NSThread sleepForTimeInterval:3];
    //        NSLog(@"end task 2");
    //    });
    //    dispatch_async(queue, ^{
    //        NSLog(@"start task 3");
    //        [NSThread sleepForTimeInterval:3];
    //        NSLog(@"end task 3");
    //    });
    
    dispatch_queue_t queue=dispatch_queue_create("com.test.gcd.group", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group=dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        [self sendRequest1:^{
            NSLog(@"end1");
        }];
        //        NSLog(@"start task 1");
        //        [NSThread sleepForTimeInterval:3];
        //        NSLog(@"end task 1");
    });
    dispatch_group_async(group, queue, ^{
        [self sendRequest2:^{
            NSLog(@"end2");
        }];
        //        NSLog(@"start task 2");
        //        [NSThread sleepForTimeInterval:3];
        //        NSLog(@"end task 2");
    });
    //    dispatch_group_async(group, queue, ^{
    //        NSLog(@"start task 3");
    //        [NSThread sleepForTimeInterval:3];
    //        NSLog(@"end task 3");
    //    });
    dispatch_group_notify(group, queue, ^{
        NSLog(@"end end !!!");
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@" back main thread");
        });
    });
}
-(void)sendRequest1:(void(^)())block
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"start task 1");
        [NSThread sleepForTimeInterval:3];
        NSLog(@"end task 1");
        
    });
}
-(void)sendRequest2:(void(^)())block
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"start task 2");
        [NSThread sleepForTimeInterval:3];
        NSLog(@"end task 2");
        
    });
}

-(void)clickBlock
{
    blockViewController*blockVC=[[blockViewController alloc]init];
    blockVC.backgroundColor=^(UIColor*color)
    {
        self.view.backgroundColor=color;
    };
    [self.navigationController pushViewController:blockVC animated:YES];
}
-(void)clickStackView
{
    stackViewController*vc=[[stackViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
