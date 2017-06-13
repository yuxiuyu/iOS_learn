//
//  stackViewController.m
//  test_NSThread
//
//  Created by jiazhen-mac-01 on 17/2/14.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "stackViewController.h"

@interface stackViewController ()

@end

@implementation stackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIStackView*stackView=[[UIStackView alloc]initWithFrame:CGRectMake(0, 250, 200, 50)];
    stackView.axis=UILayoutConstraintAxisHorizontal;
    [self.view addSubview:stackView];
    //
    UIImageView*imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    imageView.image=[UIImage imageNamed:@"sum"];
    [stackView addArrangedSubview:imageView];
    //
    UIStackView*stackViewSub=[[UIStackView alloc]initWithFrame:CGRectMake(0, 0, 150, 50)];
    stackViewSub.axis=UILayoutConstraintAxisVertical;
    [stackView addArrangedSubview:stackViewSub];
    // Do any additional setup after loading the view from its nib.
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
