//
//  LearnContentLoader.h
//  GoQuickLearn
//
//  Created by jemy on 2/12/14.
//  Copyright (c) 2014 多科学堂. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LearnContent.h"

@interface LearnContentLoader : NSObject<NSXMLParserDelegate>
@property NSMutableString* currentElementValue;
@property(strong,nonatomic) LearnContent* learnContent;
@property(strong,nonatomic) NSMutableArray* learnContents;
-(BOOL) loadLearnContent:(NSString*)  filePath;
@end
