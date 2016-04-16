//
//  MRStatusBarHUD.h
//  MRStatusBarHUD
//
//  Created by JMR on 16/4/15.
//  Copyright © 2016年 JMR. All rights reserved.
//  大版本号.功能更新版本号.BUG修复版本号
//  0.0.0

#import <UIKit/UIKit.h>

@interface MRStatusBarHUD : NSObject
/**
 *  显示普通信息
 * @param msg       文字
 * @param image     图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/** 显示普通信息 */
+ (void)showMessgae:(NSString *)msg;

/** 显示成功信息 */
+ (void)showSuccess:(NSString *)msg;

/** 显示失败信息 */
+ (void)showError:(NSString *)msg;

/** 显示正在处理的信息 */
+ (void)showLoading:(NSString *)msg;

/** 隐藏 */
+ (void)hide;
@end
