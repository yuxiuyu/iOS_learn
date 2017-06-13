//
//  loginViewController.m
//  test_RAC
//
//  Created by jiazhen-mac-01 on 17/3/16.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "loginViewController.h"
#import "LQloginInrequest.h"
@import ReactiveCocoa;
@interface loginViewController ()

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginTextF.layer.cornerRadius = 5;
    self.loginTextF.layer.borderWidth  = 1.0;
    
    self.passwordTextF.layer.cornerRadius = 5;
    self.passwordTextF.layer.borderWidth  = 1.0;
    RACSignal*usernameSignal=[_loginTextF.rac_textSignal map:^id(NSString*name) {
        return @(name.length==11);
    }];
    RACSignal*passwordSignal=[_passwordTextF.rac_textSignal map:^id(NSString* value) {
        return @(value.length>6);
    }];
    RAC(_loginTextF,layer.borderColor)=[usernameSignal map:^id(NSNumber*usernameValid) {
        return [usernameValid boolValue]?(id)[UIColor lightGrayColor].CGColor:(id)[UIColor redColor].CGColor;
    }];
    RAC(_passwordTextF,layer.borderColor)=[passwordSignal map:^id(NSNumber* passwordValid) {
         return [passwordValid boolValue]?(id)[UIColor lightGrayColor].CGColor:(id)[UIColor redColor].CGColor;
     }];
    [[RACSignal combineLatest:@[usernameSignal,passwordSignal] reduce:^id(NSNumber*usernameValid,NSNumber*passwordValid){
        return @([usernameValid boolValue]&&[passwordValid boolValue]);
    }] subscribeNext:^(NSNumber *loginBtnEnable) {
        _loginBtn.enabled=[loginBtnEnable boolValue];
    }];
    [[[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] flattenMap:^RACStream *(id value) {
        return [self loginBtnAction];
    }] subscribeNext:^(NSNumber* x) {
        if ([x boolValue])
        {
            NSLog(@"success");
        }
    }];
    
    
    // Do any additional setup after loading the view.
}
-(RACSignal*)loginBtnAction
{
    RACSignal*signal=[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        LQloginInrequest*request=[[LQloginInrequest alloc]init];
        [request loginRequest:^(BOOL issucess) {
            [subscriber sendNext:@(issucess)];
            [subscriber sendCompleted];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return signal;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
