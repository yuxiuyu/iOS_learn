//
//  ViewController.m
//  test_NSthread
//
//  Created by jiazhen-mac-01 on 17/2/27.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>
#import "ticket.h"
#import "single.h"
#import "testOperation.h"
@interface ViewController ()
{
    NSOperationQueue*queue;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton*btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(100, 50, 100, 100)];
    [btn setTitle:@"PThread" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(PthreadClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    //
    btn= [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(100, 100, 100, 100)];
    [btn setTitle:@"NSThread" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(NSthreadClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn= [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(100, 150, 100, 100)];
    [btn setTitle:@"GCD" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(GCDClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn= [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(100, 200, 100, 100)];
    [btn setTitle:@"单例" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(singleClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn= [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(100, 250, 100, 100)];
    [btn setTitle:@"time" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(timeClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn= [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(100, 300, 100, 100)];
    [btn setTitle:@"NSOperation" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(operationClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark--Pthread
-(void)PthreadClick
{
    
}
#pragma mark--NSThread
-(void)NSthreadClick
{
//    //1、alloc初始化
//    NSThread*thread = [[NSThread alloc]initWithTarget:self selector:@selector(onThread) object:nil];
//    [thread setThreadPriority:1.0f];//0~1之间   值越大优先级越高
//    [thread setName:@"ns_thread1"];
//    [thread start];
//    //2、detachNewThread
//    [NSThread detachNewThreadSelector:@selector(onThread) toTarget:self withObject:nil];
//    //3、performSelectorInBackground
//    [self performSelectorInBackground:@selector(onThread) withObject:nil];
    ticket*myticket=[[ticket alloc] init];
    [myticket beginSaleTicket];
   
}

-(void)onThread
{
    
    NSLog(@"%@,子线程执行－nsthread",[NSThread currentThread].name);
    for (int i=0; i<10; i++)
    {
        [NSThread sleepForTimeInterval:1.0f];
        NSLog(@"%d",i);
    }
}
#pragma mark--GCD
-(void)GCDClick
{
    NSLog(@"执行GCD");
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"子线程");
//        [NSThread sleepForTimeInterval:2.0f];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"主线程");
//        });
//    });
    //////dispatch_get_global_queue 全局并发的  并行
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{///////dispatch_get_global_queue(0, 0)  第一个参数设优先级的
//        NSLog(@"start task 1");
//        [NSThread sleepForTimeInterval:3.0];
//        NSLog(@"end task 1");
//    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"start task 2");
//        [NSThread sleepForTimeInterval:3.0];
//        NSLog(@"end task 2");
//    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        NSLog(@"start task 3");
//        [NSThread sleepForTimeInterval:3.0];
//        NSLog(@"end task 3");
//    });
    /////自定义串行 并行
//    dispatch_queue_t queue=dispatch_queue_create("com.yxy", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue, ^{
//        NSLog(@"start task 1");
//        [NSThread sleepForTimeInterval:3.0];
//        NSLog(@"end task 1");
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"start task 2");
//        [NSThread sleepForTimeInterval:3.0];
//        NSLog(@"end task 2");
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"start task 3");
//        [NSThread sleepForTimeInterval:3.0];
//        NSLog(@"end task 3");
//    });
    
//////
    dispatch_queue_t queue=dispatch_queue_create("com.yxy.group", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group=dispatch_group_create();
    dispatch_group_enter(group);
    [self sendRequest1:^{
          NSLog(@"request1 done");
        dispatch_group_leave(group);
    }];
    dispatch_group_enter(group);
    [self sendRequest2:^{
        NSLog(@"request2 done");
        dispatch_group_leave(group);
    }];
    
//    dispatch_group_async(group, queue, ^{
//       [self sendRequest1:^{
//             NSLog(@"request1 done");
//       }];
//    });
//    dispatch_group_async(group, queue, ^{
//        [self sendRequest2:^{
//            NSLog(@"request2 done");
//        }];
//    });
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"start task 3");
//        [NSThread sleepForTimeInterval:3.0];
//        NSLog(@"end task 3");
//    });
    dispatch_notify(group, queue, ^{
         NSLog(@"end  all task ");
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"回到主线程");
        });
    });
    
    
}
-(void)sendRequest1:(void(^)())block
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"start task 1");
        [NSThread sleepForTimeInterval:3.0];
        NSLog(@"end task 1");
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block)
            {
                 NSLog(@"request1 done");
            }
        });
       
    });
}
-(void)sendRequest2:(void(^)())block
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"start task 2");
        [NSThread sleepForTimeInterval:3.0];
        NSLog(@"end task 2");
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block)
            {
                NSLog(@"request2 done");
            }
        });
    });
}
#pragma mark--单例
-(void)singleClick
{
//    single*sin=[single shareInstance];
//    NSLog(@"%@",sin);
    static dispatch_once_t onceTocken;
    dispatch_once(&onceTocken, ^{
        NSLog(@"我只执行一次");
    });
}
#pragma mark--time
-(void)timeClick
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSLog(@"delay excute");
    });
}
#pragma mark--NSOperation
-(void)operationClick
{
    NSLog(@"main Thread");
    /////NSInvocationOperation
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"child thread");
//        NSInvocationOperation*invacationOperation=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(operationRun) object:nil];
//        [invacationOperation start];
//        NSLog(@"end child thread");
//    });
    ////NSBlockOperation
//    NSBlockOperation*blackoperation=[NSBlockOperation blockOperationWithBlock:^{
//        [self operationRun];
//    }];
////    [blackoperation start];
//    
    if (!queue)
    {
        queue =[[NSOperationQueue alloc]init];
        
    }
//    [queue addOperation:blackoperation];
//    NSLog(@"end");
    
    [queue setMaxConcurrentOperationCount:4];
    
    testOperation*operationA=[[testOperation alloc] initWithName:@"operationA"];
    testOperation*operationB=[[testOperation alloc] initWithName:@"operationB"];
    testOperation*operationC=[[testOperation alloc] initWithName:@"operationC"];
    testOperation*operationD=[[testOperation alloc] initWithName:@"operationD"];
    [operationD addDependency:operationA];
    [operationA addDependency:operationB];
    [operationB addDependency:operationC];
    [queue addOperation:operationA];
    [queue addOperation:operationB];
    [queue addOperation:operationC];
    [queue addOperation:operationD];

   
}
-(void)operationRun
{
    for (int i=0; i<3; i++)
    {
        
        NSLog(@"%d",i);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
