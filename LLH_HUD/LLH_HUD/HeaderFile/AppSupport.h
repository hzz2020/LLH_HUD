//
//  AppSupport.h
//  LLH_HUD
//
//  Created by 李龙辉 on 2017/8/5.
//  Copyright © 2017年 李龙辉. All rights reserved.
//

#ifndef AppSupport_h
#define AppSupport_h

#pragma mark ***********  MBProgressHUD  ***********

///////////////  TipMessage  ///////////////

// 显示在view上文字，1.5秒后自动消失
#define showTipMessageInView(message)                      [MBProgressHUD showTipMessageInView:message]
// 在view上显示文字，并可设定自动消失时间
#define showTipMessageInViewWithTime(message, DelayTime)   [MBProgressHUD showTipMessageInView:message timer:DelayTime]
// 显示在window上文字，1.5秒后自动消失
#define showTipMessageInWindow(message)                    [MBProgressHUD showTipMessageInWindow:message]
// 在window上显示文字，并可设定自动消失时间
#define showTipMessageInWindowWithTime(message, DelayTime) [MBProgressHUD showTipMessageInWindow:message timer:DelayTime]

///////////////  ActivityMessage  ///////////////

// 显示在view上文字，1.5秒后自动消失
#define showActivityMessageInView(message)                      [MBProgressHUD showActivityMessageInView:message]
// 在view上显示文字，并可设定自动消失时间
#define showActivityMessageInViewWithTime(message, DelayTime)   [MBProgressHUD showActivityMessageInView:message timer:DelayTime]
// 显示在window上文字，1.5秒后自动消失
#define showActivityMessageInWindow(message)                    [MBProgressHUD showActivityMessageInWindow:message]
// 在window上显示文字，并可设定自动消失时间
#define showActivityMessageInWindowWithTime(message, DelayTime) [MBProgressHUD showActivityMessageInWindow:message timer:DelayTime]



// 其他信息提示，1.5秒后自动消失
#define showInfomMessage(message)                               [MBProgressHUD showInfoMessage:message];
// 成功提示 1.5秒自动消失
#define showSuccessMessage(message)                             [MBProgressHUD showSuccessMessage:message]
// 警告提示，感叹号标志 1.5秒自动消失
#define showWarmMessage(message)                                [MBProgressHUD showWarnMessage:message]
// 出错提示，一个不高兴的图片 1.5秒后自动消失
#define showErrorMessage(message)                               [MBProgressHUD showErrorMessage:message]

// 跑啊跑啊
#define showLLHHUD [MBProgressHUD showHUD]
// 隐藏跑啊跑啊
#define hiddenLLHHUD [MBProgressHUD hideHUD]

///////////////  自定义图标信息  ///////////////
// 略~


///////////////  MBProgressHUD  ///////////////

#endif /* AppSupport_h */
