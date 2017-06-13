//
//  ViewController.m
//  yxyuitest
//
//  Created by jiazhen-mac-01 on 17/2/20.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *userPasswordTextField;
@property (weak, nonatomic) IBOutlet UISwitch *pushSwitch;
@property (weak, nonatomic) IBOutlet UIButton *pushBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginBtnAction:(id)sender {
    if ([_userNameTextField.text isEqualToString:@"xiaoming"]&&[_userPasswordTextField.text isEqualToString:@"123" ]) {
        NSLog(@"login success");
    }
    else
    {
        UIAlertController*alertVC=[UIAlertController alertControllerWithTitle:@"test" message:@"memo" preferredStyle:UIAlertControllerStyleAlert];
       UIAlertAction*sureAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
       UIAlertAction*cancelAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertVC addAction:sureAction];
        [alertVC addAction:cancelAction];
        
        [ self presentViewController:alertVC animated:YES completion:nil];
                                   
    }
}
- (IBAction)pushSwitch:(id)sender {
    _pushBtn.enabled=[_pushSwitch isOn];
}

- (IBAction)pushBtnAction:(id)sender {
    UIViewController*vc=[[UIViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
