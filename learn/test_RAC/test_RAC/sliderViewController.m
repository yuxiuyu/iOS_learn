//
//  sliderViewController.m
//  test_RAC
//
//  Created by jiazhen-mac-01 on 17/3/8.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "sliderViewController.h"
@import ReactiveCocoa;
@interface sliderViewController ()

@end

@implementation sliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _redTextF.text=_greenTextF.text=_blueTextF.text=@"0.5";
    RACSignal * redSignal   = [self blindSlider:_redSlider textField:_redTextF];
    RACSignal * greenSignal = [self blindSlider:_greenSlider textField:_greenTextF];
    RACSignal * blueSignal  = [self blindSlider:_blueSlider textField:_blueTextF];
//    [[[RACSignal combineLatest:@[redSignal,greenSignal,blueSignal]] map:^id(RACTuple* value) {
//        return [UIColor colorWithRed:[value[0] floatValue] green:[value[1] floatValue] blue:[value[2] floatValue] alpha:1.0f];
//    }] subscribeNext:^(id x) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//             _mainView.backgroundColor=x;
//        });
//       
//    }];
    
}
//-(RACSignal*)blindSlider:(UISlider*)slider textField:(UITextField*)textField
//{
//    RACSignal*textSignal=[[textField rac_textSignal] take:1];
//    RACChannelTerminal*signalSlider=[slider rac_newValueChannelWithNilValue:nil];
//    RACChannelTerminal*signalTextField=[textField rac_newTextChannel];
//    [signalTextField subscribe:signalSlider];
//    [[signalSlider map:^id(id value) {
//        return [NSString stringWithFormat:@"%0.2f",[value floatValue]];
//    }] subscribe:signalTextField];
//    return [[signalSlider merge:signalTextField] merge:textSignal];
//}


-(RACSignal*)blindSlider:(UISlider*)slider textField:(UITextField*)textField
{
    RACChannelTerminal*signalSlider=[slider rac_newValueChannelWithNilValue:nil];
    RACChannelTerminal*signalTextField=[textField rac_newTextChannel];
    [[signalSlider map:^id(id value) {
        return [NSString stringWithFormat:@"%0.2f",[value floatValue]];
    }] subscribe:signalTextField];
    [signalTextField subscribe:signalSlider];
    return [signalTextField merge:signalSlider];
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
