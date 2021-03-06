//
//  User.m
//  NoMoreARC
//
//  Created by John D Hearn on 11/15/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import "User.h"

@implementation User

//@synthesize _name, _email;

/* Setters */
-(User *)initWithName:(NSString *)name
         andBirthdate:(NSDate *)birthdate
             andEmail:(NSString *)email{
    self = [super init];
    if(self)
        [self setName:name andBirthdate:birthdate andEmail:email];

    return self;
}


-(void)setName:(NSString *)name{
    if (_name != name){
        [name retain];
        [_name release];
        // what's the difference from [name copy] ?
        _name = [NSString stringWithString: name];
    }
}
-(void)setEmail:(NSString *)email{
    if (_email != email){
        [email retain];
        [_email release];
        _email = [NSString stringWithString: email];
    }
}
-(void)setBirthdate:(NSDate *)birthdate{
    if (_birthdate != birthdate){
        [birthdate retain];
        [_birthdate release];
        _birthdate = [birthdate copy];
    }
}



-(void)setName:(NSString *)name
  andBirthdate:(NSDate *)birthdate
      andEmail:(NSString *)email{
    _name = [NSString stringWithString: name];
    _birthdate = [NSDate copy];
    _email = [NSString stringWithString: email];

}

/* Getters */

-(NSString *)name{
    return _name;
}
-(NSDate *)birthdate{
    return _birthdate;
}
-(NSString *)email{
    return _email;
}

-(NSNumber *)age{
    NSDate *now = [NSDate date];
    NSDateComponents* ageComponents =
                    [[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian] components:NSCalendarUnitYear
                                                    fromDate:_birthdate
                                                      toDate:now
                                                     options:0];
    NSLog(@"%@", [NSCalendar currentCalendar]);


    NSNumber *year = [[NSNumber alloc] initWithInteger:[ageComponents year]];
    //[ageComponents autorelease];
    //[year autorelease];
    //[now autorelease];
    return year;
}

-(id)copyWithZone:(NSZone *)zone {
    id newUser = [[[self class] allocWithZone: zone] init];
    [newUser setName:_name andBirthdate:_birthdate andEmail:_email];
    [newUser autorelease];
    return newUser;
}

-(void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_name forKey: @"UserName"];
    [encoder encodeObject:_email forKey: @"UserEmail"];
}


// Compare the two names from the specified address cards
-(NSComparisonResult)compareNames:(id)element{
    return [_name compare: [element name]];
}

-(NSString *)description{
    NSString *description = [[NSString alloc]
                             initWithFormat:@"NAME:%@ - EMAIL:%@", self.name, self.email];

    [description autorelease];
    return description;
}

-(void)print{
    NSNumber *yearsNumber = [self age];
    NSString *yearsOld = [[NSString alloc] initWithFormat:@"%@", yearsNumber];
    // This breaks code, not sure why.

    NSLog (@"===================================");
    NSLog (@"|                                 |");
    NSLog (@"| %-31s |", [_name UTF8String]);
    NSLog (@"| %-31s |", [_email UTF8String]);
    //NSLog (@"| %-31s |", [yearsOld UTF8String]);
    NSLog (@"|                                 |");
    NSLog (@"|                                 |");
    NSLog (@"|       O                 O       |");
    NSLog (@"===================================");
    //[yearsOld release];
}

-(void)dealloc{
    [_name release];
    [_birthdate release];
    [_email release];
    _name = nil;
    _birthdate = nil;
    _email = nil;

    //NSLog(@"User Retain Count: %li", [self retainCount]);

    [super dealloc];
}
@end
