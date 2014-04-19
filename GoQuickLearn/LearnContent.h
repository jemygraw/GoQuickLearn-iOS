//
//  LearnContent.h
//  GoQuickLearn
//
//  Created by jemy on 2/12/14.
//  Copyright (c) 2014 多科学堂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LearnContent : NSObject<NSCopying>
@property(strong,nonatomic) NSString* name;
@property(strong,nonatomic) NSString* abstract;
@property(strong,nonatomic) NSString* chapter;
@end
