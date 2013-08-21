//
//  NetworkRequestViewController.h
//  MyHttpRequest
//
//  Created by Dong JiaLi on 12-12-27.
//  Copyright (c) 2012年 Dong JiaLi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MacrosClass.h"
#import "ASIDownloadCache.h"
#import "AppDelegate.h"
#import "XmlPerser.h"
@interface NetworkRequestViewController : UIViewController<UITextViewDelegate>
{
    UITextView *textview_;
    AppDelegate *appDelegate_;
    XmlPerser *xmlPerser_;
}
@end
