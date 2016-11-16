//
//  ViewController.m
//  ClassRoster
//
//  Created by John D Hearn on 11/16/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import "ViewController.h"
#import "../Models/StudentStore.h"

@interface ViewController ()<UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *allStudents = [[StudentStore shared] allStudents];
    NSLog(@"%@", allStudents);

    //CREATE NEW STUDENT TO SAVE
    //Student *newStudent = [[Student alloc] initWithFirstName:@"Adam" lastName:@"Wallraff" email:@"adam@codfollows.com" phone:@"+1 (234) 567-8910"];
    Student *newerStudent = [[Student alloc] initWithFirstName:@"Brook" lastName:@"Riggio" email:@"brook@codfollows.com" phone:@"+1 (234) 567-8910"];

    [[StudentStore shared] add:newerStudent];

    //add tableView datasource
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
