//
//  Student.m
//  ClassRoster
//
//  Created by John D Hearn on 11/16/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import "Student.h"

@implementation Student

-(instancetype)initWithFirstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                           email:(NSString *)email{
    self = [super init];
    if(self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.email = email;
    }
    return self;
}

//MARK: NSCopying Protocol methods
-(id)copyWithZone:(NSZone *)zone{
    Student *student = [[Student alloc] init];
    student.firstName = self.firstName;
    student.lastName = self.lastName;
    student.email = self.email;

    return student;
}

//MARK: NSCoding Protocol methods
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self){
        self.firstName = [aDecoder decodeObjectForKey:@"firstName"];
        self.lastName = [aDecoder decodeObjectForKey:@"lastName"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
    }

    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.firstName forKey:@"firstName"];
    [aCoder encodeObject:self.lastName forKey:@"lastName"];
    [aCoder encodeObject:self.email forKey:@"email"];
}

@end
