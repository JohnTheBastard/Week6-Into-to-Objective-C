//
//  User.h
//  NoMoreARC
//
//  Created by John D Hearn on 11/15/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
{
    NSString *_name;
    NSString *_email;
}

-(void)setName:(NSString *)name;
-(void)setEmail:(NSString *)email;
-(NSString *)name;
-(NSString *)email;

-(NSString *)description;

@end
