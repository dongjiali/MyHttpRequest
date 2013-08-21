//
//  XmlPerser.h
//  CUSTOMERSERVICE
//
//  Created by JiaLi Dong on 11-12-28.
//  Copyright (c) 2011年 sinosoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XmlPerser : NSObject <NSXMLParserDelegate>
{
    NSString *strElementName_;
    NSMutableString *result_;
    NSString *mark_;
    BOOL recordResults_;
}
- (BOOL)XmlPerserdata:(NSData *)webData ResultMark:(NSString *)resultMark ResultData:(NSMutableString *)resultData;
@end
