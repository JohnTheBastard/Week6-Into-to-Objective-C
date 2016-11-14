//
//  Person.m
//  Objective-C_Demo
//
//  Created by John D Hearn on 11/14/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import "Person.h"

@implementation Person

NSString *_name;


-(void)setName:(NSString *)name{
    _name = name;
}

-(NSString *)name{
    return _name;
}

-(void)walk{
    NSLog(@"This person is walking...");
}

+(void)sayHello{
    NSLog(@"Hello, there.");
}

@end
