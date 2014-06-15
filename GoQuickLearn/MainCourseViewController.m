//
//  ViewController.m
//  GoQuickLearn
//
//  Created by jemy on 2/12/14.
//  Copyright (c) 2014 多科学堂. All rights reserved.
//

#import "MainCourseViewController.h"
#import "CourseContentViewController.h"
#import "LearnContentLoader.h"
@interface MainCourseViewController ()

@end

@implementation MainCourseViewController
@synthesize courseList;
@synthesize basicLearnCourseList;
@synthesize exampleLearnCourseList;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //load basic content
    LearnContentLoader* loader=[[LearnContentLoader alloc]init];
    
    NSString* filePath=[[NSBundle mainBundle]pathForResource:@"basic_course_list" ofType:@"xml"];
    [loader loadLearnContent:filePath];
    self.basicLearnCourseList=[loader.learnContents copy];
    
    //load example content
    filePath=[[NSBundle mainBundle]pathForResource:@"example_course_list" ofType:@"xml"];
    [loader loadLearnContent:filePath];
    self.exampleLearnCourseList=[loader.learnContents copy];
    
    //release
    loader.learnContent=nil;
    loader.learnContents=nil;
    loader=nil;
    
    //basic
    self.courseList=self.basicLearnCourseList;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableSampleIdentifier=@"TableSampleIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:tableSampleIdentifier];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:tableSampleIdentifier];
    }
    NSUInteger row=[indexPath row];
    LearnContent *learnContent=[self.courseList objectAtIndex:row];
    cell.textLabel.text=[learnContent name];
    cell.detailTextLabel.text=[learnContent abstract];
    cell.detailTextLabel.textColor=[UIColor grayColor];
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.courseList count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"ShowCourseContent" sender:self.courseListTableView];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowCourseContent"]){
        if([segue.destinationViewController isKindOfClass:[CourseContentViewController class]]){
            UITableView *tableView=(UITableView*)sender;
            NSInteger selectedRowIndex=[[tableView indexPathForSelectedRow] row];
            LearnContent *learnContent=[self.courseList objectAtIndex:selectedRowIndex];
            NSString *chapter=learnContent.chapter;
            NSString *filePath=[[NSBundle mainBundle]pathForResource:chapter ofType:@"html"];
            CourseContentViewController *courseViewController=(CourseContentViewController*)segue.destinationViewController;
            
            courseViewController.courseFilePath=filePath;
            courseViewController.courseName=learnContent.name;
            courseViewController.courseIndex=selectedRowIndex;
            courseViewController.courseList=self.courseList;
        }
    }
}

-(void)viewDidUnload
{
    [super viewDidUnload];
    self.courseList=nil;
    self.basicLearnCourseList=nil;
    self.exampleLearnCourseList=nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)courseCategoryChange:(UISegmentedControl *)sender {
    NSInteger selectedIndex=[self.courseCategory selectedSegmentIndex];
    if(selectedIndex==0)
    {
        self.courseList=self.basicLearnCourseList;
    }
    else if(selectedIndex==1)
    {
        self.courseList=self.exampleLearnCourseList;
    }
    [self.courseListTableView reloadData];
}
@end
