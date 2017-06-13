//
//  ViewController.m
//  test_RAC
//
//  Created by jiazhen-mac-01 on 17/3/8.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "ViewController.h"
@import ReactiveCocoa;
@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _userNameLab.delegate=self;
//    _passwordTextField.delegate=self;
//    _loginBtn.enabled=NO;
    
    
//    RACSignal*enableSignal=[_userNameLab.rac_textSignal map:^id(NSString* value) {
//        return @(value.length>0);
//    }];
//    [self.userNameLab.rac_textSignal subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    
    RACSignal*enableSignal=[[RACSignal combineLatest:@[_userNameLab.rac_textSignal,_passwordTextField.rac_textSignal]] map:^id(id value) {
        NSLog(@"%@",value);
        return @([value[0] length]>0&&[value[1] length]>=6);
    }];
    _loginBtn.rac_command=[[RACCommand alloc]initWithEnabled:enableSignal signalBlock:^RACSignal *(id input) {
        return [RACSignal empty];
    }];

    

}






//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//   
//    NSString*str=[textField.text stringByReplacingCharactersInRange:range withString:string];
//    NSString*s1=_userNameLab.text;
//    NSString*s2=_passwordTextField.text;
//    if (textField==_userNameLab)
//    {
//        s1=str;
//    }
//    else
//    {
//        s2=str;
//    }
//    if (s1.length>0&&s2.length>=6)
//    {
//        _loginBtn.enabled=YES;
//    }
//    else
//    {
//        _loginBtn.enabled=NO;
//    }
//    NSLog(@"%@  %@",s1,s2);
//    
//    return YES;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginBtn:(id)sender {
}
@end
