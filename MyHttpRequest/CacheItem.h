//
//  CacheItem.h
//  MyHttpRequest
//
//  Created by Curry on 13-2-21.
//  Copyright (c) 2013年 Dong JiaLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CacheItemDelegate;
/* ---------缓存项-------------- */
@interface CacheItem : NSObject {
@public
    id<CacheItemDelegate> delegate;
    //web地址
    NSString              *remoteURL;
@private
    //是否正在下载
    BOOL                  isDownloading;
    //NSMutableData对象
    NSMutableData         *connectionData;
    //NSURLConnection对象
    NSURLConnection       *connection;
}
/* -------------------------- */
@property (nonatomic, assign) id<CacheItemDelegate> delegate;
@property (nonatomic, retain) NSString  *remoteURL;
@property (nonatomic, assign) BOOL      isDownloading;
@property (nonatomic, retain) NSMutableData *connectionData;
@property (nonatomic, retain) NSURLConnection *connection;
/* ----------开始下载方法----------- */
- (BOOL) startDownloadingURL:(NSString *)paramRemoteURL;
@end

@protocol CacheItemDelegate <NSObject>
//下载成功执行该方法
-(void) cacheItemDelegateSucceeded  :(CacheItem *)paramSender  withRemoteURL:(NSURL *)paramRemoteURL  withAboutToBeReleasedData:(NSData *)paramAboutToBeReleasedData;
//下载失败执行该方法
- (void) cacheItemDelegateFailed  :(CacheItem *)paramSender  remoteURL:(NSURL *)paramRemoteURL  withError:(NSError *)paramError;
@end
