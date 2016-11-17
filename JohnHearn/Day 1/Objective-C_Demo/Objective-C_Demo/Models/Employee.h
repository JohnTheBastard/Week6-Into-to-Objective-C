//
//  Employee.h
//  Objective-C_Demo
//
//  Created by John D Hearn on 11/14/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import "Person.h"

@interface Employee : Person

/* Accessor Methods */
-(void)setEmployeeNumber:(NSInteger *)employeeNumber;
-(NSInteger *)employeeNumber;
-(void)setHireDate:(NSDate *)hireDate;
-(NSDate *)hireDate;
-(void)setManager:(Employee *)manager;
-(Employee *)manager;

/* Instance Methods */
-(NSInteger)yearsEmployeed;
-(NSString *)managersName;

/* Class Methods */
+(void)printNamesNotGlobal:(NSMutableArray *)employees;

@end
