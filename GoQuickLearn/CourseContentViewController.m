//
//  CourseContentViewController.m
//  GoQuickLearn
//
//  Created by jemy on 3/16/14.
//  Copyright (c) 2014 多科学堂. All rights reserved.
//

#import "CourseContentViewController.h"

@interface CourseContentViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *courseContentWebView;

@end

@implementation CourseContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewDidLoad
{
    NSURL *url=[NSURL fileURLWithPath:self.courseFilePath];
    [self.courseContentWebView loadRequest:[NSURLRequest requestWithURL:url]];
    self.title=self.courseName;
}
@end
