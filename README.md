# GCDTimerDemo
GCDTimer，解决后台计时器停止问题  使用方法：
将项目中的 HaiGCDTimerFramework.framework拖入你的项目中，然后在要实现的地方导入，并实现下面方法：
```   if ([_timeLable.text intValue] &lt;= 0)   
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
```
