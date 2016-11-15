//
//  User.m
//  NoMoreARC
//
//  Created by John D Hearn on 11/15/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import "User.h"

@implementation User

/* Setters */
-(void)setName:(NSString *)name{
    if (_name != name){
        [name retain];
        [_name release];
        _name = name;
    }
}
-(void)setEmail:(NSString *)email{
    if (_email != email){
        [email retain];
        [_email release];
        _email = email;
    }
}
/* Getters */
-(NSString *)name{
    return _name;
}
-(NSString *)email{
    return _email;
}

-(NSString *)desctiption{
    NSString *description = [[NSString alloc]
                             initWithFormat:@"NAME:%@ - EMAIL:%@", self.name, self.email];

    [description autorelease];
    return description;
}
@end
