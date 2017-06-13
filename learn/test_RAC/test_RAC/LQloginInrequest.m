//
//  LQloginInrequest.m
//  test_RAC
//
//  Created by jiazhen-mac-01 on 17/3/16.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "LQloginInrequest.h"

@implementation LQloginInrequest
-(void)loginRequest:(loginbtnRequestComplele)complete
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        BOOL issuccess=YES;
        complete(issuccess);
    });
}
@end
