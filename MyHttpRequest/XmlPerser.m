//
//  XmlPerser.m
//  CUSTOMERSERVICE
//
//  Created by JiaLi Dong on 11-12-28.
//  Copyright (c) 2011年 sinosoft. All rights reserved.
//

#import "XmlPerser.h"

@implementation XmlPerser

- (BOOL)XmlPerserdata:(NSData *)webData ResultMark:(NSString *)resultMark ResultData:(NSMutableString *)resultData
{
    mark_ = resultMark;
    result_ = resultData;    
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:webData]; //设置XML数据
    [parser setShouldProcessNamespaces:NO];
    [parser setShouldReportNamespacePrefixes:NO];
    [parser setShouldResolveExternalEntities:NO];
    [parser setDelegate: self];
    [parser parse];
    [parser release];
    return YES;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ( [elementName isEqualToString:@"meta"] )
    {
        recordResults_ = YES;
    }

}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
//    if ( recordResults_ )
//    {
        [result_ appendString:string];
    NSLog(@"%@",string);
//    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ( [elementName isEqualToString:mark_] )
    {
        recordResults_ = FALSE;
        NSLog(@"xml_result=%@",result_);
        
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"xml解析结束");
}

- (void)dealloc
{
    [super dealloc];
}

@end
