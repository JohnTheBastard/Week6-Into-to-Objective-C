//
//  ViewController.m
//  ClassRoster
//
//  Created by John D Hearn on 11/16/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import "ViewController.h"
#import "../Views/RosterCell.h"
#import "../Models/StudentStore.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) NSArray *allStudents;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"%@", self.allStudents);

    //CREATE NEW STUDENT TO SAVE
    Student *adam = [[Student alloc] initWithFirstName:@"Adam"
                                              lastName:@"Wallraff"
                                                 email:@"adam@codfollows.com"
                                                 phone:@"+1 (234) 567-8910"];
    [[StudentStore shared] add:adam];

    Student *brook = [[Student alloc] initWithFirstName:@"Brook"
                                               lastName:@"Riggio"
                                                  email:@"brook@codfollows.com"
                                                  phone:@"+1 (234) 565-4321"];
    [[StudentStore shared] add:brook];

    Student *brandy = [[Student alloc] initWithFirstName:@"Brandy"
                                                lastName:@"Rhodes"
                                                   email:@"brandy@codfollows.com"
                                                   phone:@"+1 (800) 800-8000"];
    [[StudentStore shared] add:brandy];

    Student *roman = [[Student alloc] initWithFirstName:@"Roman"
                                               lastName:@"Lopez"
                                                  email:@"roman@codfollows.com"
                                                  phone:@"+1 (987) 654-3210"];
    [[StudentStore shared] add:roman];
}


//MARK: UITableViewDataSource Protocol Methods
-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //TODO: We're not saving our data fast enough in viewDidAppear to populate
    //      our array, so try here.
    self.allStudents = [[StudentStore shared] allStudents];

    RosterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RosterCell"];

    if (cell == nil) {
        cell = [[RosterCell alloc] initWithStyle:UITableViewCellStyleDefault
                                 reuseIdentifier:@"RosterCell"];
    }

    Student *currentStudent = [self.allStudents objectAtIndex:indexPath.row];
    cell.nameLabel.text = [[NSString alloc] initWithFormat:@"%@, %@", currentStudent.lastName, currentStudent.firstName];
    cell.emailLabel.text = currentStudent.email;
    cell.phoneLabel.text = currentStudent.phone;
    
    return cell;
}


-(NSInteger) tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return [[StudentStore shared] count];
}


@end
