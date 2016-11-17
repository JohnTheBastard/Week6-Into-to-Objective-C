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
                           email:(NSString *)email
                           phone:(NSString *)phone{
    self = [super init];
    if(self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.email = email;
        self.phone = phone;
    }
    return self;
}

- (NSComparisonResult)compare:(Student *)otherObject {
    return [self.lastName compare:otherObject.lastName];
}

//MARK: NSCopying Protocol methods
-(id)copyWithZone:(NSZone *)zone{
    Student *student = [[Student alloc] init];
    student.firstName = self.firstName;
    student.lastName = self.lastName;
    student.email = self.email;
    student.phone = self.phone;

    return student;
}

//MARK: NSCoding Protocol methods
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self){
        self.firstName = [aDecoder decodeObjectForKey:@"firstName"];
        self.lastName = [aDecoder decodeObjectForKey:@"lastName"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.phone = [aDecoder decodeObjectForKey:@"phone"];
    }

    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.firstName forKey:@"firstName"];
    [aCoder encodeObject:self.lastName forKey:@"lastName"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
}

@end
