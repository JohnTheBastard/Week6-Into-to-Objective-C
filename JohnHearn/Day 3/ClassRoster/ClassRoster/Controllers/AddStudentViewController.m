//
//  AddStudentViewController.m
//  ClassRoster
//
//  Created by John D Hearn on 11/17/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import "../Models/StudentStore.h"
#import "AddStudentViewController.h"

@interface AddStudentViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@end

@implementation AddStudentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveButtonPressed:(id)sender {
    if([self.firstNameField.text isEqualToString:@""]
       || [self.lastNameField.text isEqualToString:@""]
       || [self.emailField.text isEqualToString:@""]
       || [self.phoneField.text isEqualToString:@""]) {

        NSLog(@"Invalid input.");

    } else {

    //CREATE NEW STUDENT TO SAVE
    Student *newStudent = [[Student alloc] initWithFirstName:self.firstNameField.text
                                                    lastName:self.lastNameField.text
                                                       email:self.emailField.text
                                                       phone:self.phoneField.text];
    [[StudentStore shared] add:newStudent];

    self.firstNameField.text = @"";
    self.lastNameField.text = @"";
    self.emailField.text = @"";
    self.phoneField.text = @"";


    [self dismissViewControllerAnimated:YES completion:nil];
    }
}





@end
