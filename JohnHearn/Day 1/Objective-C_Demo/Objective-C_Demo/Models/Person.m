//
//  Person.m
//  Objective-C_Demo
//
//  Created by John D Hearn on 11/14/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import "Person.h"

@interface Person (){
    NSString *_name;
}@end

@implementation Person

-(void)setName:(NSString *)name{
    _name = name;
}

-(NSString *)name{
    return _name;
}

-(void)walk{
    NSLog(@"This person is walking...");
}

-(int)nameAddress{
//    int *p;
//    *p = &_name;
//    int q = *p;
//    int foo = &_name;
    return &_name;
}

+(void)sayHello{
    NSLog(@"Hello, there.");
}

@end
