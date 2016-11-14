//
//  ViewController.m
//  Objective-C_Demo
//
//  Created by John D Hearn on 11/14/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerDataSource.h"
#import "../Models/Person.h"

//int gMoveNumber = 10;


@interface ViewController ()<UIPageViewControllerDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    Person *testSubject = [[Person alloc] init];

    [testSubject setName:@"Adam"];

    NSString *name = [testSubject name];

    NSLog(@"%@", name);

    [testSubject walk];

    [Person sayHello];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
