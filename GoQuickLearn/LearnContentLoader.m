//
//  LearnContentLoader.m
//  GoQuickLearn
//
//  Created by jemy on 2/12/14.
//  Copyright (c) 2014 多科学堂. All rights reserved.
//

#import "LearnContentLoader.h"

@implementation LearnContentLoader

@synthesize currentElementValue;
@synthesize learnContents;
@synthesize learnContent;

-(BOOL) loadLearnContent:(NSString *)filePath
{
    NSFileHandle *fileHandle=[NSFileHandle fileHandleForReadingAtPath:filePath];
    NSData *fileData=[fileHandle readDataToEndOfFile];
    [fileHandle closeFile];
    
    NSXMLParser *parser=[[NSXMLParser alloc]initWithData:fileData];
    [parser setDelegate:self];
    
    BOOL flag=[parser parse];
    return flag;
}

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ContentList"])
    {
        learnContents=[[NSMutableArray alloc]init];
    }
    else if([elementName isEqualToString:@"Content"])
    {
        learnContent=[[LearnContent alloc]init];
    }
}
-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if(!currentElementValue)
    {
        currentElementValue=[[NSMutableString alloc]initWithString:string];
    }
    else
    {
        [currentElementValue appendString:string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if([elementName isEqualToString:@"Content"])
    {
        [learnContents addObject:learnContent];
        learnContent=nil;
    }
    else
    {
        NSString* trimmedString=[currentElementValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [currentElementValue setString:@""];
        if([elementName isEqualToString:@"Name"])
        {
            learnContent.name=trimmedString;
        }
        else if([elementName isEqualToString:@"Abstract"])
        {
            learnContent.abstract=trimmedString;
        }
        else if([elementName isEqualToString:@"Chapter"])
        {
            learnContent.chapter=trimmedString;
        }
    }
}
@end
