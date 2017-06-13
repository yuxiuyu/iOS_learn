//
//  single.m
//  test_NSthread
//
//  Created by jiazhen-mac-01 on 17/2/27.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "single.h"

@implementation single
+(instancetype)shareInstance
{
    static dispatch_once_t once;
    static single*shareInstance=nil;
    dispatch_once(&once, ^{
        NSLog(@"single 初始化");
        shareInstance=[[single alloc]init];
    });
    return shareInstance;
}
@end
