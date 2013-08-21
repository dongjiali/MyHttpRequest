//
//  CachedDownloadManager.h
//  MyHttpRequest
//
//  Created by Curry on 13-2-21.
//  Copyright (c) 2013年 Dong JiaLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CacheItem.h"
@interface CachedDownloadManager : NSObject
<CacheItemDelegate> {
@public
//    id<CachedDownloadManagerDelegate>  delegate;
@private
    //记录缓存数据的字典
    NSMutableDictionary                *cacheDictionary;
    //缓存的路径
    NSString                           *cacheDictionaryPath;
}

//@property (nonatomic, assign) id<CachedDownloadManagerDelegate> delegate;
@property (nonatomic, copy) NSMutableDictionary *cacheDictionary;
@property (nonatomic, retain) NSString *cacheDictionaryPath;

/* 保持缓存字典 */
- (BOOL) saveCacheDictionary;
/* 公有方法：下载 */
- (BOOL) download:(NSString *)paramURLAsString
   urlMustExpireInSeconds:(NSTimeInterval)paramURLMustExpireInSeconds
updateExpiryDateIfInCache:(BOOL)paramUpdateExpiryDateIfInCache;
/* -------------------------- */
@end