//
//  AppDelegate.h
//  MyHttpRequest
//
//  Created by Dong JiaLi on 12-12-26.
//  Copyright (c) 2012年 Dong JiaLi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIDownloadCache.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    
    ASIDownloadCache *myCache;
}
@property (nonatomic,retain) ASIDownloadCache *myCache;
@property (strong, nonatomic) UIWindow *window;

@end
