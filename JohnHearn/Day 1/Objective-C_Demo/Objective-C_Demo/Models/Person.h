//
//  Person.h
//  Objective-C_Demo
//
//  Created by John D Hearn on 11/14/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

/* Accessor Methods */
-(void)setName:(NSString *)name;
-(NSString *)name;

/* Instance Methods */
-(void)walk;

/* Class Methods */
+(void)sayHello;

@end
