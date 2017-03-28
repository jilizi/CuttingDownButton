//
//  TimeCutDownBtn.m
//  WavesAnimationDemo
//
//  Created by apple on 2017/3/28.
//  Copyright © 2017年 YangQiang. All rights reserved.
//

#import "TimeCutDownBtn.h"

@interface TimeCutDownBtn ()
@property (nonatomic , strong)NSTimer *timer;
@property (nonatomic , assign)CGFloat time;
@end

@implementation TimeCutDownBtn
- (instancetype)init{
    self = [super init];
    if (self) {
        [self initProperty];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initProperty];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initProperty];
    }
    return self;
}
#pragma mark --- Public Metthods ---
- (void)start{
    self.userInteractionEnabled = NO;
    self.time = self.totalTime;
    //开启计时器
    self.timer.fireDate = [NSDate distantPast];
}
- (void)dismiss{
    if ([self isCuttingDown]) {
        [self reset];
    }
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}
- (BOOL)isCuttingDown{
    if (self.time <= 0) {
        return NO;
    }else{
        return YES;
    }
}
#pragma mark --- Private Methods ---
- (void)initProperty{
    self.backgroundColor = [UIColor orangeColor];
    [self setTitle:self.startTitle forState:(UIControlStateNormal)];
    [self setTintColor:[UIColor blackColor]];
}
- (void)reset{
    self.time = self.totalTime;
    self.userInteractionEnabled = YES;
    [self setTitle:self.startTitle forState:(UIControlStateNormal)];
}
- (void)timeUp{
    self.time = self.time - 1;
    [self setTitle:[NSString stringWithFormat:@"%@%ld秒",self.cuttingTitle,(long)self.time] forState:UIControlStateNormal];
    [self stop];
}
- (void)stop{
    if (self.time <= 0) {
        //结束计时
        self.timer.fireDate = [NSDate distantFuture];
        self.userInteractionEnabled = YES;
        [self setTitle:self.resetTitle forState:UIControlStateNormal];
    }
}
#pragma mark --- Setterr && Getter ----
- (void)setTotalTime:(CGFloat)totalTime{
    if (totalTime) {
        _totalTime = totalTime;
    }
}
- (NSTimer *)timer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeUp) userInfo:nil repeats:YES];
        self.time = self.totalTime;
    }
    return _timer;
}
- (NSString *)startTitle{
    if (!_startTitle) {
        _startTitle = @"点击获取验证码";
    }
    return _startTitle;
}
- (NSString *)resetTitle{
    if (!_resetTitle) {
        _resetTitle = @"重新获取";
    }
    return _resetTitle;
}
- (NSString *)cuttingTitle{
    if (!_cuttingTitle) {
        _cuttingTitle = @"";
    }
    return _cuttingTitle;
}
@end
