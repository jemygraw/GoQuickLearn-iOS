//
//  CourseContentViewController.m
//  GoQuickLearn
//
//  Created by jemy on 3/16/14.
//  Copyright (c) 2014 多科学堂. All rights reserved.
//

#import "CourseContentViewController.h"
#import "LearnContent.h"

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
    //check whether to show the next chapter button
    if(self.courseIndex==[self.courseList count]-1){
        self.nextChapterBtn.enabled=NO;
    }else{
        self.nextChapterBtn.enabled=YES;
    }
    NSURL *url=[NSURL fileURLWithPath:self.courseFilePath];
    [self.courseContentWebView loadRequest:[NSURLRequest requestWithURL:url]];
    self.title=self.courseName;
}
- (IBAction)nextChapterClicked:(UIBarButtonItem *)sender {
    self.courseIndex++;
    if(self.courseIndex==[self.courseList count]-1){
        self.nextChapterBtn.enabled=NO;
    }else{
        self.nextChapterBtn.enabled=YES;
    }
    LearnContent *learnContent=[self.courseList objectAtIndex:self.courseIndex];
    NSString *chapter=learnContent.chapter;
    NSString *filePath=[[NSBundle mainBundle]pathForResource:chapter ofType:@"html"];
    self.courseFilePath=filePath;
    self.courseName=learnContent.name;
    NSURL *url=[NSURL fileURLWithPath:self.courseFilePath];
    [self.courseContentWebView loadRequest:[NSURLRequest requestWithURL:url]];
    self.title=self.courseName;
    
}
@end
