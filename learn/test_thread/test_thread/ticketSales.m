//
//  ticketSales.m
//  test_NSThread
//
//  Created by jiazhen-mac-01 on 17/2/9.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "ticketSales.h"
#define TicketCount 50
@interface ticketSales()
{
    int remainTicketCount;
    int salesTicketCount;
    NSThread*thread_sh;
    NSThread*thread_BJ;
    NSCondition*ticketCondition;
}
@end
@implementation ticketSales
-(instancetype)init
{
    if (self=[super init])
    {
        remainTicketCount=TicketCount;
        ticketCondition=[[NSCondition alloc]init];
        thread_BJ=[[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];
        [thread_BJ setName:@"BJ"];
        thread_sh=[[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];
        [thread_sh setName:@"SH"];
        
       
    }
    return self;
}
-(void)saleTicket
{
    while (remainTicketCount>0)
    {
//        @synchronized (self) {
        [ticketCondition lock];
            [NSThread sleepForTimeInterval:0.5];
            remainTicketCount--;
            salesTicketCount=TicketCount-remainTicketCount;
            NSLog(@"已卖%d  剩余%d %@",salesTicketCount,remainTicketCount,[NSThread currentThread].name);
        [ticketCondition unlock];
//        }
        
    }
   
}
-(void)startSaleTicket
{
    [thread_sh start];
    [thread_BJ start];
}
@end
