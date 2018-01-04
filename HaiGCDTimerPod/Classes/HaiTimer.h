//
//  HaiTimer.h
//  HaiGCDTimerFramework
//
//  Created by Ios_Developer on 2018/1/2.
//  Copyright © 2018年 hai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 GCD定时器 后台定时器失效解决，利用UIApplicationDidEnterBackgroundNotification监测后台任务。
 在程序进入后台，锁屏时处理方法。
 [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{}];
 [[UIApplication sharedApplication] endBackgroundTask:_bgTask];完成后调用的方法，一定要写
 */
typedef void(^HandlerBlock)(int presentTime);
typedef void(^TimerBlock)(void);
@interface HaiTimer : NSObject


-(void)timerWithTimeout:(int)timeout handlerBlock:(HandlerBlock)handlerBlock finish:(TimerBlock)finish;

-(void)stopGCDTimer;
@end
