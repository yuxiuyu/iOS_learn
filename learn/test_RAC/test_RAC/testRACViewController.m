//
//  testRACViewController.m
//  test_RAC
//
//  Created by jiazhen-mac-01 on 17/3/8.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "testRACViewController.h"
@import ReactiveCocoa;
@interface testRACViewController ()

@end

@implementation testRACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    //信号量
//    RACSignal*viewDidAppaerSignal=[self rac_signalForSelector:@selector(viewDidAppear:)];
//    [viewDidAppaerSignal subscribeNext:^(id x) {
//        NSLog(@"%s",__func__);
//        NSLog(@"%@",x);
//    }];
//    [viewDidAppaerSignal subscribeError:^(NSError *error) {
//        
//    }];
//    [viewDidAppaerSignal subscribeCompleted:^{
//        
//    }];
//    
//    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
//    [button setRac_command:[[RACCommand alloc] initWithEnabled:nil signalBlock:^RACSignal *(id input) {
//        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//            NSLog(@"click");
//          dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//              [subscriber sendNext:[[NSDate date] description]];
//              [subscriber sendCompleted];
//          });
//           
//            return [RACDisposable disposableWithBlock:^{
//                //处理需要释放的对象；
//            }];
//        }];
//    }]];
//    [[[button rac_command] executionSignals] subscribeNext:^(id x) {
//        [x subscribeNext:^(id x) {
//            NSLog(@"%@",x);
//        }];
//    }];
//    [button setTitle:@"click me" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [button setBounds:CGRectMake(100, 200, 100, 100)];
//    [button setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
//    [self.view addSubview:button];
    
//    [[self signalFromjson:@"http://www.orzer.club/test.json"] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    
    
    
//    
//    RACSignal*s1= [self signalFromjson:@"http://www.orzer.club/test.json"];
//    RACSignal*s2= [self signalFromjson:@"http://www.orzer.club/test.json"];
//    RACSignal*s3= [self signalFromjson:@"http://www.orzer.club/test.json"];
//    [[s1 merge:s2] merge:s3];
    /////按顺序执行 s1 s2 s3
//    [[[s1 then:^RACSignal *{
//        return s2;
//    }] then:^RACSignal *{
//        return s3;
//    }] subscribeNext:^(id x) {
//         NSLog(@"%@",x);
//    }];
    ////同步等三个都执行完才返回
//    [[RACSignal combineLatest:@[s1,s2,s3]] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    
//    RACSignal*viewDidAppearSignal=[self rac_signalForSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    // Do any additional setup after loading the view.
    
    
    __block int a=10;
    RACSignal*signal=[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        a+=5;
        [subscriber sendNext:@(a)];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }] replayLast];
    [signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    [signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    /////
    //RACSequence
    RACSequence*seq1=[signal sequence];
    [seq1 signal];
    NSArray*arr=@[@(1),@(2)];
    RACSequence*seq=[arr rac_sequence];
    NSLog(@"%@",[[seq map:^id(id value) {
        return @([value integerValue]*3);
    }] array]);
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self setNeedsStatusBarAppearanceUpdate];
    NSLog(@"%s",__func__);
}
-(RACSignal*)signalFromjson:(NSString*)urlstr
{
    //
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSURLSessionConfiguration*c=[NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession*session=[NSURLSession sessionWithConfiguration:c];
        NSURLSessionDataTask*data=[session dataTaskWithURL:[NSURL URLWithString:urlstr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error)
            {
                [subscriber sendError:error];
            }
            else
            {
                NSError*error;
                NSDictionary*dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
                if (error)
                {
                    [subscriber sendError:error];
                }
                else
                {
                    NSLog(@"%@",dic);
                    [subscriber sendNext:dic[@"result"]];
                    [subscriber sendCompleted];
                }
                
            }
        }];
        [data resume];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
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
