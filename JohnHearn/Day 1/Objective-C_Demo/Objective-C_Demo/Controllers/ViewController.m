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

    NSNumber *number1 =@123;
    NSNumber *number2 =@321;
    if([number1 isEqualToNumber:number2]) {

    }

    switch ([number1 compare:number2]) {
        case NSOrderedSame:
            NSLog(@"Values are equal");
            break;
        case NSOrderedAscending:
            NSLog(@"Values are ascending");
            break;
        case NSOrderedDescending:
            NSLog(@"Values are descending");
            break;
    }

    //NSString *string = [NSString stringWithFormat:@"%@, %@", number1, number2];

    NSString *str1 = @"one";
    NSString *str2 = @"two";
    NSString *str3 = @"three";
    NSNumber *number = @55;
    NSArray *array = [NSArray arrayWithObjects:str1, str2, str3, number, nil];
    NSArray *array2 = @[str1, str2, str3, number];

    if ( [array isEqualToArray:array2] ){
        NSLog(@"true");
    }

    NSDictionary *dictionary = @{@"str1":str1, @2:str2, @"str3":str3};

    NSString *first = [dictionary objectForKey:@"str1"];
    NSString *second = dictionary[@2];

    NSMutableDictionary *mutDict = [[NSMutableDictionary alloc] init];
    [mutDict setObject:number forKey:@2];

//  @{@"str1":str1, @2:str2, @"str3":str3};
//
//    NSString *first = [dictionary objectForKey:@"str1"];
//    NSString *second = dictionary[@2];

    NSFileManager *fileManager = [NSFileManager defaultManager];

    NSArray *urls = [fileManager URLsForDirectory:NSDocumentDirectory
                                        inDomains:NSUserDomainMask];

    NSLog(@"%@", urls);

    



}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
