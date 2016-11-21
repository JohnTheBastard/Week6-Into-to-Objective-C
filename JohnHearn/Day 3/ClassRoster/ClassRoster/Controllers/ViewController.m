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
#import "AddStudentViewController.h"

//static void *kvoContext = &kvoContext;

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) NSArray *allStudents;
@property (weak, nonatomic) StudentStore * store;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;

    //CREATE NEW STUDENT TO SAVE
//    Student *adam = [[Student alloc] initWithFirstName:@"Adam"
//                                              lastName:@"Wallraff"
//                                                 email:@"adam@codfollows.com"
//                                                 phone:@"+1 (234) 567-8910"];
//    [[StudentStore shared] add:adam];
//
//    Student *brook = [[Student alloc] initWithFirstName:@"Brook"
//                                               lastName:@"Riggio"
//                                                  email:@"brook@codfollows.com"
//                                                  phone:@"+1 (234) 565-4321"];
//    [[StudentStore shared] add:brook];
//
//    Student *brandy = [[Student alloc] initWithFirstName:@"Brandy"
//                                                lastName:@"Rhodes"
//                                                   email:@"brandy@codfollows.com"
//                                                   phone:@"+1 (800) 800-8000"];
//    [[StudentStore shared] add:brandy];
//
//    Student *roman = [[Student alloc] initWithFirstName:@"Roman"
//                                               lastName:@"Lopez"
//                                                  email:@"roman@codfollows.com"
//                                                  phone:@"+1 (987) 654-3210"];
//    [[StudentStore shared] add:roman];
//
    self.store = [StudentStore shared];

    [self addObserver:self
           forKeyPath:@"store.students"
              options:NSKeyValueObservingOptionNew
              context:&kvoContext];


}

//-(void)viewWillAppear:(BOOL)animated{
//    NSLog(@"%@", self.allStudents);
//    //self.allStudents = [[StudentStore shared] allStudents];
//    [self.tableView reloadData];
//    //self.allStudents = [[StudentStore shared] allStudents];
//}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context{
    if(context == kvoContext){
        NSLog(@"\n\nObserver Fired in VC!\n\n");
        self.allStudents = [[StudentStore shared] allStudents];
        [self.tableView reloadData];
    } else {
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
}

+(BOOL)automaticallyNotifiesObserversOfAllStudents{
    return NO;
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
    cell.nameLabel.text = [[NSString alloc] initWithFormat:@"%@, %@",
                           currentStudent.lastName, currentStudent.firstName];
    cell.emailLabel.text = currentStudent.email;
    cell.phoneLabel.text = currentStudent.phone;
    
    return cell;
}


-(NSInteger) tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return [[StudentStore shared] count];
}


-(IBAction)addStudentButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"AddStudentViewControllerSegue"
                              sender:sender];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    
//    if([[segue identifier] isEqualToString:@"AddStudentViewControllerSegue"]){
//        AddStudentViewController *addStudentVC = [segue destinationViewController];
//
//        // You can pass stuff to the new VC if you want to here.
//    }

}

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"store.students"];
}
@end
