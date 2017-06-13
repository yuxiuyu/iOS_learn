//
//  ViewController.h
//  test_RAC
//
//  Created by jiazhen-mac-01 on 17/3/8.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userNameLab;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)loginBtn:(id)sender;
-(void)blindSlider:(UISlider*)slider textfield:(UITextField*)textfield;
@end

