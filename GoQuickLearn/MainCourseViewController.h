//
//  ViewController.h
//  GoQuickLearn
//
//  Created by jemy on 2/12/14.
//  Copyright (c) 2014 多科学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCourseViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic) NSArray *courseList;
@property(strong,nonatomic) NSArray *basicLearnCourseList;
@property (strong, nonatomic) IBOutlet UISegmentedControl *courseCategory;
- (IBAction)courseCategoryChange:(UISegmentedControl *)sender;
@property (strong, nonatomic) IBOutlet UITableView *courseListTableView;
@property(strong,nonatomic) NSArray *exampleLearnCourseList;
@end
