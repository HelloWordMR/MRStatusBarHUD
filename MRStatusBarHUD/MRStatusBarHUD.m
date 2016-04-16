//
//  MRStatusBarHUD.m
//  MRStatusBarHUD
//
//  Created by JMR on 16/4/15.
//  Copyright © 2016年 JMR. All rights reserved.
//

#import "MRStatusBarHUD.h"

#define MRMessageFont [UIFont systemFontOfSize:12]
@implementation MRStatusBarHUD

/** 消息的停留时间 */
static CGFloat const MRMessageDuration = 2.0;
/** 消息显示\隐藏的动画时间 */
static CGFloat const MRAnimationDuration = 0.3;

static UIWindow *window_;
static NSTimer *timer_;

+ (void)showWindow
{
    // frame 数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    // 显示窗口
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.frame = frame;
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:MRAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

/**
 *  显示普通信息
 * @param msg       文字
 * @param image     图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    // 停止定时器
    [timer_ invalidate];
    
    // 显示窗口
    [self showWindow];
    
    // 添加按钮
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = MRMessageFont;
    if (image) { // 如果有图片
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    // 定时器 -- （给timer_这个指针重新赋值相当于原来的指针赋值为nil）
    timer_ = [NSTimer scheduledTimerWithTimeInterval:MRMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/** 显示普通信息 */
+ (void)showMessgae:(NSString *)msg
{
    [self showMessage:msg image:nil];
}

/** 显示成功信息 */
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"MRStatusBarHUD.bundle/success"]];
}

/** 显示失败信息 */
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"MRStatusBarHUD.bundle/error"]];
}

/** 显示正在处理的信息 */
+ (void)showLoading:(NSString *)msg
{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 显示窗口
    [self showWindow];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = MRMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    // 添加小菊花
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    
    // 文字的宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : MRMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
    
}

/** 隐藏 */
+ (void)hide
{
    [UIView animateWithDuration:MRAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}

@end
