//
//  AppDefine.h
//  LLH_HUD
//
//  Created by 李龙辉 on 2017/8/5.
//  Copyright © 2017年 李龙辉. All rights reserved.
//

#ifndef AppDefine_h
#define AppDefine_h

/***************** Frame, size, width, height *****************/
//获取屏幕尺寸 宽度、高度
#define SCREEN_RECT          [[UIScreen mainScreen] bounds]
#define SCREEN_WIDTH         [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT        [[UIScreen mainScreen] bounds].size.height
//单像素线宽
#define SINGLE_LINE_WIDTH    (1 / [UIScreen mainScreen].scale)

/***************** Color *****************/
#define RGB(r,g,b)           [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBA(r,g,b,a)        [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define RGB_HEX(s)           [UIColor colorWithRed:((s & 0xFF0000) >> 16)/255.0f green:((s & 0xFF00) >> 8)/255.0f blue:(s & 0xFF)/255.0f alpha:1]
#define RGBA_HEX(s,a)        [UIColor colorWithRed:((s & 0xFF0000) >> 16)/255.0f green:((s & 0xFF00) >> 8)/255.0f blue:(s & 0xFF)/255.0f alpha:a]



#endif /* AppDefine_h */
