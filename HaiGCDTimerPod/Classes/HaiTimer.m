//
//  HaiTimer.m
//  HaiGCDTimerFramework
//
//  Created by Ios_Developer on 2018/1/2.
//  Copyright © 2018年 hai. All rights reserved.
//

#import "HaiTimer.h"

dispatch_source_t timer;

static int _timeout;

@interface HaiTimer()
{
     UIBackgroundTaskIdentifier _bgTask;
}

@property (nonatomic, strong) HandlerBlock handlerBlock;

@property (nonatomic, strong) TimerBlock finish;
@end
@implementation HaiTimer

- (void)timerWithTimeout:(int)timeout handlerBlock:(HandlerBlock)handlerBlock finish:(TimerBlock)finish
{
    [self createTimerWithTimeout:timeout handlerBlock:handlerBlock finish:finish];
}
- (void)stopGCDTimer
{
    if(timer)
    {
        dispatch_source_cancel(timer);
    }
    
    [[UIApplication sharedApplication] endBackgroundTask:_bgTask];
    _bgTask = UIBackgroundTaskInvalid;
}

#pragma mark  ===== action  =====
- (void)createTimerWithTimeout:(int)timeout handlerBlock:(HandlerBlock)handlerBlock finish:(TimerBlock)finish {
    
    _timeout = timeout;
    self.handlerBlock = handlerBlock;
    self.finish = finish;
    
    [self startTimer];
    
    //后台计数通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(appGoToBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
}


- (void)startTimer
{
    
    int interval = 1;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), interval * NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(timer, ^{
        
        if (_timeout <= 0) {
            
            NSLog(@"倒计时结束");
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (_finish) {
                    _finish();
                }
            });
            
            dispatch_source_cancel(timer);
            
        } else {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (_handlerBlock) {
                    _handlerBlock(_timeout);
                }
                _timeout --;
            });
        }
        
    });
    
    // 开启定时器
    dispatch_resume(timer);
    
}

#pragma mark ===== NotificationCenter =====
- (void)appGoToBackground:(NSNotification *)sender
{
    UIApplication *app = [UIApplication sharedApplication];
    __block  UIBackgroundTaskIdentifier _bgTask;
    _bgTask = [app beginBackgroundTaskWithExpirationHandler:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (_bgTask != UIBackgroundTaskInvalid)
            {
                _bgTask = UIBackgroundTaskInvalid;
            }
        });
    }];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (_bgTask != UIBackgroundTaskInvalid)
            {
                _bgTask = UIBackgroundTaskInvalid;
            }
        });
    });
}
@end
