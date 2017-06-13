//
//  twoViewController.h
//  test_RAC
//
//  Created by jiazhen-mac-01 on 17/3/9.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>
@import ReactiveCocoa;
@interface twoViewController : UIViewController
@property(nonatomic,strong)RACSubject*subject;
- (IBAction)notifyBtnAction:(id)sender;
@end
