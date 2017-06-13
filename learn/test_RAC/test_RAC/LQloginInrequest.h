//
//  LQloginInrequest.h
//  test_RAC
//
//  Created by jiazhen-mac-01 on 17/3/16.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^loginbtnRequestComplele)(BOOL issucess);
@interface LQloginInrequest : NSObject
-(void)loginRequest:(loginbtnRequestComplele)complete;
@end
