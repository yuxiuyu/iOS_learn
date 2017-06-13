//
//  ticket.m
//  test_NSthread
//
//  Created by jiazhen-mac-01 on 17/2/27.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "ticket.h"
#define totalTicket 50
@interface ticket()
{
    NSThread * sh_Thread;
    NSThread * bj_Thread;
    NSInteger saleTicket;
    NSCondition*condition;
}
@end
@implementation ticket
-(instancetype)init
{
    if (self=[super init])
    {
        condition=[[NSCondition alloc]init];
        saleTicket=0;
        sh_Thread=[[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];
        [sh_Thread setName:@"sh_thread"];
        bj_Thread=[[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];
        [bj_Thread setName:@"bj_thread"];
    }
    return self;
}
-(void)beginSaleTicket
{
    [sh_Thread start];
    [bj_Thread start];
}
-(void)saleTicket
{
    while(true)
    {
        [condition lock];
        if  (totalTicket-saleTicket>0)
        {
            [NSThread sleepForTimeInterval:0.5f];
            saleTicket++;
            NSLog(@"已售%ld  还剩%ld   ++++%@",saleTicket,totalTicket-saleTicket,[NSThread currentThread].name);
        }
        [condition unlock];
       
    }
}
@end
