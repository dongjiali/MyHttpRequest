//
//  QueueNetworkRequestViewController.h
//  MyHttpRequest
//
//  Created by Dong JiaLi on 13-1-4.
//  Copyright (c) 2013年 Dong JiaLi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MacrosClass.h"
#import "ASINetworkQueue.h"
@interface QueueNetworkRequestViewController : UIViewController<UITextViewDelegate>
{
    NSOperationQueue *queue_;
    ASINetworkQueue *networkqueue_;
    UITextView *textview_;
    UIImageView *imageView1_;
    UIImageView *imageView2_;
    UIImageView *imageView3_;
    UIProgressView *progressIndicator_;
    UIProgressView *progressIndicator1_;
    UIProgressView *progressIndicator2_;
    UIProgressView *progressIndicator3_;
    UILabel *progressData_;
    UILabel *progressData_1;
    UILabel *progressData_2;
    UILabel *progressData_3;
    float totalSize_;
}
@property(nonatomic,retain) NSOperationQueue *queue;
@property(nonatomic,retain) ASINetworkQueue *networkqueue;

@end
