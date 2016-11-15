//
//  Employee.m
//  Objective-C_Demo
//
//  Created by John D Hearn on 11/14/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import "Employee.h"

// This is bad, but I wanted to see how to
// define a global-scoped function
void printNames(NSMutableArray *employees) {
    for(Employee *employee in employees){
//        NSLog(@"%x", [employee nameAddress]);
//        NSLog(@"Employee address:    %p", employee);
//        NSLog(@"Name address:        %p", [employee name]);
        NSLog(@"%@", [employee name]);
    }

}

@interface Employee (){
    NSInteger *_employeeNumber;
    NSDate *_hireDate;
    Employee *_manager;
}@end

@implementation Employee

-(void)setEmployeeNumber:(NSInteger *)employeeNumber{
    _employeeNumber = employeeNumber;
}

-(NSInteger *)employeeNumber{
    return _employeeNumber;
}

-(void)setHireDate:(NSDate *)hireDate{
    _hireDate = hireDate;
}

-(NSDate *)hireDate{
    return _hireDate;
}

-(void)setManager:(Employee *)manager{
    _manager = manager;
}

-(Employee *)manager{
    return _manager;
}

-(NSInteger)yearsEmployeed{
    NSDate* now = [NSDate date];
    NSDateComponents* employmentTimeComponents =
                                [[NSCalendar currentCalendar]
                                 components:NSCalendarUnitYear
                                 fromDate:_hireDate
                                 toDate:now
                                 options:0];

    return [employmentTimeComponents year];
}

-(NSString *)managersName{
    return [_manager name];
}

+(void)printNamesNotGlobal:(NSMutableArray *)employees {
    NSLog(@"%@", [employees[0] name]);
    for(Employee *employee in employees){
//        NSLog(@"Address: %d", [employee nameAddress]);
        NSLog(@"Address: %p", [employee name]);
        NSLog(@"Value:   %@", [employee name]);
    }
}

@end
