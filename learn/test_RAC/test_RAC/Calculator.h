//
//  Caculator.h
//  test_RAC
//
//  Created by jiazhen-mac-01 on 17/3/8.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject
@property(nonatomic,assign)BOOL isEqual;
@property(nonatomic,assign)int result;
typedef int(^calculator)(int result);
typedef BOOL(^equal)(int result);
-(Calculator*)calculator:(calculator)calculator;
-(Calculator*)equal:(equal)equal;
@end
