//
//  testLoginViewController.m
//  test_RAC
//
//  Created by jiazhen-mac-01 on 17/3/16.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "testLoginViewController.h"
@import ReactiveCocoa;
@interface testLoginViewController ()

@end

@implementation testLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RACSignal*newSignal=[@"A B C D E F G" componentsSeparatedByString:@""].rac_sequence.signal;
    [newSignal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    __block unsigned subscriptions=0;
    RACSignal*loggingSignal=[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        subscriptions++;
        [subscriber sendCompleted];
        return nil;
    }];
    loggingSignal=[loggingSignal doCompleted:^{
        subscriptions++;
        NSLog(@"about to complete subsription %u",subscriptions);
    }];
    [loggingSignal subscribeCompleted:^{
         NSLog(@" subsription %u",subscriptions);
    }];
    
    RACSequence*sep=[@"H I J K L M N" componentsSeparatedByString:@" "].rac_sequence;
    [sep map:^id(NSString* value) {
        NSLog(@"%@",value);
        return [value stringByAppendingString:value];
    }];
    [sep filter:^BOOL(id value) {
         NSLog(@"%@",value);
        return @([value isEqualToString:@"H"]);
    }];
    [sep.signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
   
    RACSequence*numbers=[@"0 1 2 3 4 5 6" componentsSeparatedByString:@" "].rac_sequence;
    [numbers filter:^BOOL(id value) {
        return ([value intValue]%2==0);
    }] ;
//    NSLog(@"arr:%@",arr);
    [numbers.signal subscribeNext:^(id x) {
        NSLog(@"++%@",x);
    }];
    
   
    
//
//    RACSignal*userNameSignal=[_userNameTextF.rac_textSignal map:^id(id value) {
//        NSLog(@"%@",value);
//        return @([value length]>2);
//    }];
//    RACSignal*passwordSignal=[_passwordTextF.rac_textSignal map:^id(id value) {
//        NSLog(@"%@",value);
//        return @([value length]>6);
//    }];
//    RACSignal*uerSignal=[RACSignal combineLatest:@[_userNameTextF.rac_textSignal,_passwordTextF.rac_textSignal] reduce:^id(NSString*username,NSString*password){
//        return @(username.length>2&&password.length>6);
//    }];
//    RAC(_userNameTextF,backgroundColor)=[userNameSignal map:^id(NSNumber* value) {
//        return [value boolValue]?[UIColor whiteColor]:[UIColor redColor];
//    }];
//    RAC(_passwordTextF,backgroundColor)=[userNameSignal map:^id(NSNumber* value) {
//        return [value boolValue]?[UIColor whiteColor]:[UIColor redColor];
//    }];
//    [uerSignal subscribeNext:^(NSNumber* x) {
//        _loginBtn.enabled=[x boolValue];
//    }];
//    [[[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] flattenMap:^RACStream *(id value) {
//            RACSignal*signal=[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC*2)), dispatch_get_main_queue(), ^{
//                    NSLog(@"success");
//                    [subscriber sendNext:@(YES)];
//                    [subscriber sendCompleted];
//                });
//                return [RACDisposable disposableWithBlock:^{
//    
//                }];
//            }];
//            return signal;
//    }] subscribeNext:^(id x) {
//        NSLog(@"success");
//    }];
//    [[RACSignal combineLatest:@[userNameSignal,passwordSignal] reduce:^id(NSNumber*username,NSNumber*password){
//        NSLog(@"%@",@([username boolValue]&&[password boolValue]));
//        return @([username boolValue]&&[password boolValue]);
//    }] subscribeNext:^(NSNumber * x) {
//        _loginBtn.enabled=[x boolValue];
//    }];
//    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] map:^id(id value) {
//        NSLog(@"%@",value);
//        RACSignal*signal=[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//            return [RACDisposable disposableWithBlock:^{
//                
//            }];
//        }];
//        return signal;
//    }];
//    [[[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] flattenMap:^RACStream *(id value) {
//        NSLog(@"%@",value);
//        RACSignal*signal=[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC*2)), dispatch_get_main_queue(), ^{
//                NSLog(@"success");
//                [subscriber sendNext:@(YES)];
//                [subscriber sendCompleted];
//            });
//            return [RACDisposable disposableWithBlock:^{
//                
//            }];
//        }];
//        return signal;
//    }] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    
    // Do any additional setup after loading the view.
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
