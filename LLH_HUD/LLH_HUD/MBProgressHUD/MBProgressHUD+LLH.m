//
//  MBProgressHUD+LLH.m
//  LLH_HUD
//
//  Created by 李龙辉 on 2017/8/5.
//  Copyright © 2017年 李龙辉. All rights reserved.
//

#import "MBProgressHUD+LLH.h"
#define ANIMATION_TIME_LEFT    0.2
#define ANIMATION_TIME_RIGHT   1.1
#define DelayTime  1.5

@implementation MBProgressHUD (LLH)

+ (MBProgressHUD*)createMBProgressHUDviewWithMessage:(NSString*)message isWindiw:(BOOL)isWindow
{
    UIView  *view = isWindow? (UIView*)[UIApplication sharedApplication].delegate.window:[self getCurrentUIVC].view;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text=message?message:@"加载中...";
    hud.label.font=[UIFont systemFontOfSize:15];
    hud.removeFromSuperViewOnHide = YES;
    hud.backgroundView.color = [UIColor clearColor];
    return hud;
}


#pragma mark-------------------- show Tip----------------------------

+ (void)showTipMessageInWindow:(NSString*)message
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showTipMessage:message isWindow:true timer:DelayTime];
    });
}
+ (void)showTipMessageInView:(NSString*)message
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showTipMessage:message isWindow:false timer:DelayTime];
    });
}
+ (void)showTipMessageInWindow:(NSString*)message timer:(double)aTimer
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showTipMessage:message isWindow:true timer:aTimer];
    });
}
+ (void)showTipMessageInView:(NSString*)message timer:(double)aTimer
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showTipMessage:message isWindow:false timer:aTimer];
    });
    
}
+ (void)showTipMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(double)aTimer
{
    MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeText;
    [hud hideAnimated:YES afterDelay:aTimer];
}


#pragma mark-------------------- show Activity----------------------------

+ (void)showActivityMessageInWindow:(NSString*)message
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showActivityMessage:message isWindow:true timer:0];
    });
    
}
+ (void)showActivityMessageInView:(NSString*)message
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showActivityMessage:message isWindow:false timer:0];
    });
    
}
+ (void)showActivityMessageInWindow:(NSString*)message timer:(double)aTimer
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showActivityMessage:message isWindow:true timer:aTimer];
    });
    
}
+ (void)showActivityMessageInView:(NSString*)message timer:(double)aTimer
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showActivityMessage:message isWindow:false timer:aTimer];
    });
    
}
+ (void)showActivityMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(double)aTimer
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeIndeterminate;
    if (aTimer>0) {
        [hud hideAnimated:YES afterDelay:aTimer];
    }
}


#pragma mark-------------------- show Image----------------------------

+ (void)showSuccessMessage:(NSString *)Message
{
    
    [self showCustomIconInWindow:@"MBHUD_Success" message:Message];
}
+ (void)showErrorMessage:(NSString *)Message
{
    [self showCustomIconInWindow:@"MBHUD_Error" message:Message];
}
+ (void)showInfoMessage:(NSString *)Message
{
    [self showCustomIconInWindow:@"MBHUD_Info" message:Message];
}
+ (void)showWarnMessage:(NSString *)Message
{
    [self showCustomIconInWindow:@"MBHUD_Warn" message:Message];
}
+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message
{
    [self showCustomIcon:iconName message:message isWindow:true];
    
}
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message
{
    [self showCustomIcon:iconName message:message isWindow:false];
}
+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    hud.mode = MBProgressHUDModeCustomView;
    [hud hideAnimated:YES afterDelay:DelayTime];
}



+ (void)showHUD {
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:@"" isWindiw:true];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    // 设置一下填充类型，使小人和原来一样胖
    imageView.contentMode = UIViewContentModeScaleAspectFill;
//    imageView.animationImages = @[[UIImage imageNamed:@"left0"], [UIImage imageNamed:@"left1"]];
//    imageView.animationDuration = ANIMATION_TIME_LEFT;
    imageView.animationImages = @[[UIImage imageNamed:@"right0"], [UIImage imageNamed:@"right1"], [UIImage imageNamed:@"right2"],
                                  [UIImage imageNamed:@"right3"], [UIImage imageNamed:@"right4"], [UIImage imageNamed:@"right5"],
                                  [UIImage imageNamed:@"right6"], [UIImage imageNamed:@"right7"], [UIImage imageNamed:@"right8"],
                                  [UIImage imageNamed:@"right9"], [UIImage imageNamed:@"right10"]];
    imageView.animationDuration = ANIMATION_TIME_RIGHT;
    imageView.animationRepeatCount = 0;
    [imageView startAnimating];
    hud.customView = imageView;
    hud.mode = MBProgressHUDModeCustomView;
    hud.animationType = MBProgressHUDAnimationZoomOut;
    // 不主动消失。
//    [hud hideAnimated:YES afterDelay:5];
    // 设置画布的颜色
    hud.bezelView.color = [UIColor clearColor];
}

+ (void)hideHUD {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIView  *winView =(UIView*)[UIApplication sharedApplication].delegate.window;
        [self hideHUDForView:winView animated:YES];
        [self hideHUDForView:[self getCurrentUIVC].view animated:YES];
    });
    
}
//获取当前屏幕显示的viewcontroller
+(UIViewController *)getCurrentWindowVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows)
        {
            if (tempWindow.windowLevel == UIWindowLevelNormal)
            {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        result = nextResponder;
    }
    else
    {
        result = window.rootViewController;
    }
    return  result;
}
+(UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [[self class]  getCurrentWindowVC];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }
    return superVC;
}



@end
