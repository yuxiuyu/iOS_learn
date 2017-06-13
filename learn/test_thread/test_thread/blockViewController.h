//
//  blockViewController.h
//  test_NSThread
//
//  Created by jiazhen-mac-01 on 17/2/9.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface blockViewController : UIViewController
typedef void(^changeColor)(id);
@property(copy,nonatomic)changeColor backgroundColor;
@end
