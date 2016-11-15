//
//  AddressCard.m
//  NoMoreARC
//
//  Created by John D Hearn on 11/15/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import "AddressCard.h"

@implementation AddressCard

@synthesize _name, _email;

/* Setters */

//-(void)setName:(NSString *)name{
//    if (_name != name){
//        [name retain];
//        [_name release];
//        _name = [NSString stringWithString: name];
//    }
//}
//-(void)setEmail:(NSString *)email{
//    if (_email != email){
//        [email retain];
//        [_email release];
//        _email = [NSString stringWithString: email];
//    }
//}

-(void)setName:(NSString *)name andEmail:(NSString *)email {
    self._name = [NSString stringWithString: name];
    self._email = [NSString stringWithString: email];
    [name release];
    [email release];
}

/* Getters */

//-(NSString *)name{
//    return _name;
//}
//-(NSString *)email{
//    return _email;
//}


-(id)copyWithZone:(NSZone *)zone {
    id newCard = [[[self class] allocWithZone: zone] init];

    [newCard setName:self._name andEmail:self._email];
    [newCard autorelease];
    return newCard;
}

-(void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self._name forKey: @"AddressCardName"];
    [encoder encodeObject:self._email forKey: @"AddressCardEmail"];
    [encoder release];
}


// Compare the two names from the specified address cards
-(NSComparisonResult)compareNames:(id)element{
    [element autorelease];
    return [self._name compare: [element name]];
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

    NSLog(@"AddressCard Retain Count: %li", [self retainCount]);

    [super dealloc];
}
@end
