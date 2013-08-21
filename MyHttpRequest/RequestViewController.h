//
//  RequestViewController.h
//  MyHttpRequest
//
//  Created by Dong JiaLi on 12-12-26.
//  Copyright (c) 2012年 Dong JiaLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *titleNameArray_;
}
@property(nonatomic,retain)NSArray *titleNameArray;
@end
