//
//  sliderViewController.h
//  test_RAC
//
//  Created by jiazhen-mac-01 on 17/3/8.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sliderViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UITextField *redTextF;
@property (weak, nonatomic) IBOutlet UITextField *greenTextF;
@property (weak, nonatomic) IBOutlet UITextField *blueTextF;

@property (weak, nonatomic) IBOutlet UIView *mainView;

@end
