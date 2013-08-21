//
//  MacrosClass.h
//  MyHttpRequest
//
//  Created by Dong JiaLi on 12-12-26.
//  Copyright (c) 2012年 Dong JiaLi. All rights reserved.
//
/*获取当前设置的屏幕宽和高*/
#define DeviceScreenWidth   [UIScreen mainScreen].bounds.size.width
#define DeviceScreenHeight  [UIScreen mainScreen].bounds.size.height

/*设置Color宏替换*/
#define ColorWithRGBA(R,G,B,A)  [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]
#define ColorClear [UIColor clearColor]

/*设置UIimagel图片宏替换*/
#define ImageWithNameAndType(__name,__type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:__name ofType:__type]]