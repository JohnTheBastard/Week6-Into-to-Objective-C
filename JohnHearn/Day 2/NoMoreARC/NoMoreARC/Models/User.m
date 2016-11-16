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

-(void)setName:(NSString *)name{
    if (_name != name){
//        [name retain];
        [_name release];
        // what's the difference from [name copy] ?
        _name = [NSString stringWithString: name];
    }
}
-(void)setEmail:(NSString *)email{
    if (_email != email){
//        [email retain];
        [_email release];
        _email = [NSString stringWithString: email];
    }
}
-(void)setBirthdate:(NSDate *)birthdate{
    if (_birthdate != birthdate){
//        [birthdate retain];
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

-(NSInteger)age{
    NSDate *now = [NSDate date];
    NSDateComponents* ageComponents =
                    [[NSCalendar currentCalendar] components:NSCalendarUnitYear
                                                    fromDate:_birthdate
                                                      toDate:now
                                                     options:0];
    [now release];
    [ageComponents autorelease];
    return [ageComponents year];
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
    NSLog (@"===================================");
    NSLog (@"|                                 |");
    NSLog (@"| %-31s |", [_name UTF8String]);
    NSLog (@"| %-31s |", [_email UTF8String]);
    NSLog (@"|                                 |");
    NSLog (@"|                                 |");
    NSLog (@"|                                 |");
    NSLog (@"|       O                 O       |");
    NSLog (@"===================================");
}

-(void)dealloc{
    [_name release];
    [_email release];
    _name = nil;
    _email = nil;

    NSLog(@"User Retain Count: %li", [self retainCount]);

    [super dealloc];
}
@end
