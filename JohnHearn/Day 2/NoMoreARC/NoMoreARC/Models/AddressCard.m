//
//  AddressCard.m
//  NoMoreARC
//
//  Created by John D Hearn on 11/15/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import "AddressCard.h"

@implementation AddressCard

/* Setters */
-(void)setName:(NSString *)name{
    if (_name != name){
        [name retain];
        [_name release];
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
/* Getters */
-(NSString *)name{
    return _name;
}
-(NSString *)email{
    return _email;
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
