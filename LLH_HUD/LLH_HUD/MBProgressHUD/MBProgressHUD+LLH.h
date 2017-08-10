//
//  MBProgressHUD+LLH.h
//  LLH_HUD
//
//  Created by 李龙辉 on 2017/8/5.
//  Copyright © 2017年 李龙辉. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (LLH)

/**
 TipMessage
 */
+ (void)showTipMessageInWindow:(NSString*)message;
+ (void)showTipMessageInView:(NSString*)message;
+ (void)showTipMessageInWindow:(NSString*)message timer:(double)aTimer;
+ (void)showTipMessageInView:(NSString*)message timer:(double)aTimer;


/**
 ActivityMessage
 */
+ (void)showActivityMessageInWindow:(NSString*)message;
+ (void)showActivityMessageInView:(NSString*)message;
+ (void)showActivityMessageInWindow:(NSString*)message timer:(double)aTimer;
+ (void)showActivityMessageInView:(NSString*)message timer:(double)aTimer;


/**
 默认图标信息
 */
+ (void)showInfoMessage:(NSString *)Message;
+ (void)showSuccessMessage:(NSString *)Message;
+ (void)showErrorMessage:(NSString *)Message;
+ (void)showWarnMessage:(NSString *)Message;

/**
 自定义图标信息
 */
+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message;
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message;

/**
 手动加载
 */
+ (void)showHUD;

/**
 手动退出加载
 */
+ (void)hideHUD;

@end
