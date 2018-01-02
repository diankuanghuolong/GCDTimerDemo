//
//  ViewController.m
//  GCDTimer
//
//  Created by Ios_Developer on 2018/1/2.
//  Copyright © 2018年 hai. All rights reserved.
//

#import "ViewController.h"
#import <GCDTimerFramework/GCDTimerFramework.h>

@interface ViewController ()

@property (nonatomic ,strong)UILabel *timeLable;
@property (nonatomic ,strong)NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 80, 40)];
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 200, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    _timeLable = label;
}

#pragma mark ===== action  =====
-(void)didClick:(UIButton *)sender
{
    if ([_timeLable.text intValue] <= 0)
    {
        HaiTimer *haiTimer = [HaiTimer new];
        [haiTimer timerWithTimeout:60 handlerBlock:^(int presentTime) {
            
            NSLog(@"%d",presentTime);
            _timeLable.text = [NSString stringWithFormat:@"%d",presentTime];
        } finish:^{
            
            _timeLable.text = @"0";
            [haiTimer stopGCDTimer];
        }];
    }
}

@end

