# GCDTimerDemo
[简书](https://www.jianshu.com/p/b3d9a6d46675)

GCDTimer，解决进入后台，计时器停止问题  使用方法：

导入，

方法一：将Demo中的 HaiGCDTimerFramework.framework拖入你的项目中；

方法二：pod 方法，终端输入 pod search HaiGCDTimerPod ,然后导入到你的项目中，pod install;（⚠️如果你本地的cocoapods的索引搜索不到，请先更新cocoapods，方法： pod setup（初始化） 完成后，移除本地缓存，rm ~/Library/Caches/CocoaPods/search_index.json） 

   然后在要实现的地方导入头文件，并实现下面方法：
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

![展示图](https://github.com/diankuanghuolong/GCDTimerDemo/blob/master/GCDTimer/showImages/HaiGCDTimer.gif)
