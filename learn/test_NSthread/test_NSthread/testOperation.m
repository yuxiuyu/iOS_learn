//
//  testOperation.m
//  test_NSthread
//
//  Created by jiazhen-mac-01 on 17/2/27.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "testOperation.h"
@interface testOperation()
@property(copy,nonatomic)NSString*operationName;
@property BOOL over;
@end
@implementation testOperation
-(instancetype)initWithName:(NSString*)operationName
{
    if (self==[super init])
    {
        self.operationName=operationName;
    }
    return self;
}
-(void)main
{
//    for (int i=0; i<3; i++)
//    {
//        [NSThread sleepForTimeInterval:1.0f];
//        NSLog(@"%d   %@",i,_operationName);
//    }
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:1.0f];
        if (self.isCancelled)
        {
            return ;
        }
        self.over=YES;
        NSLog(@"%@",_operationName);
    });
    while (!_over&&!self.cancelled)
    {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
}
@end
