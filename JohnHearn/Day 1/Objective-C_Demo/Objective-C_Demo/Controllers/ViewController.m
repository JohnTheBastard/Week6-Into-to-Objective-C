//
//  ViewController.m
//  Objective-C_Demo
//
//  Created by John D Hearn on 11/14/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerDataSource.h"
#import "../Models/Employee.h"
#import "../Models/NSString+WordArray.h"

extern void printNames(NSMutableArray *people);

@interface ViewController ()<UIPageViewControllerDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableArray *employees = [NSMutableArray array];

    Employee *dave = [[Employee alloc] init];
    [dave setName:@"Dave"];
    [dave setManager:dave];


    Employee *brook = [[Employee alloc] init];
    [brook setName:@"Brook"];
    [brook setManager:dave];


    Employee *adam = [[Employee alloc] init];
    [adam setName:@"Adam"];
    [adam setManager:brook];


    Employee *roman = [[Employee alloc] init];
    [roman setName:@"Roman"];
    [roman setManager:adam];


    [employees addObject:dave];
    [employees addObject:brook];
    [employees addObject:adam];
    [employees addObject:roman];


    NSLog(@"\n\nGlobal function call...");
    printNames(employees);
//
//    NSLog(@"\n\nScoped function call...");
//    [Employee printNamesNotGlobal:employees];

    
    //NSString *name = [testSubject name];

    //NSLog(@"%@", name);

    //[testSubject walk];

    [Person sayHello];

    NSString *sentence = @"The quick red fox jumped over the lazy brown dog.";

    NSArray *wordArray = [sentence asWordArray];

    for(NSString *word in wordArray){
        NSLog(@"%@", word);
    }


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
