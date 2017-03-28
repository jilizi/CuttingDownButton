//
//  TimeCutDownBtn.h
//  WavesAnimationDemo
//
//  Created by apple on 2017/3/28.
//  Copyright © 2017年 YangQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeCutDownBtn : UIButton
@property (nonatomic , assign)CGFloat totalTime;//倒计时的时间
@property (nonatomic , copy)NSString *startTitle;//开始时按钮的标题
@property (nonatomic , copy)NSString *cuttingTitle;//倒计时时按钮的标题
@property (nonatomic , copy)NSString *resetTitle;//重新开始倒计时的标题

- (void)start;//点击按钮开始倒计时
- (void)dismiss;//离开倒计时按钮所在的界面时调用
- (BOOL)isCuttingDown;//是否正在倒计时
@end
