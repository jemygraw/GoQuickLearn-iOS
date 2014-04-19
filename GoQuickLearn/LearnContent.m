//
//  LearnContent.m
//  GoQuickLearn
//
//  Created by jemy on 2/12/14.
//  Copyright (c) 2014 多科学堂. All rights reserved.
//

#import "LearnContent.h"

@implementation LearnContent
@synthesize name;
@synthesize abstract;
@synthesize chapter;
-(id) copyWithZone:(NSZone *)zone
{
    LearnContent *newLearnContent=[[LearnContent allocWithZone:zone]init];
    newLearnContent.name=self.name;
    newLearnContent.abstract=self.abstract;
    newLearnContent.chapter=self.chapter;
    return newLearnContent;
}
@end
