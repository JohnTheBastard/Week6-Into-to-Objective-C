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
    NSDate *_birthdate;
    NSString *_email;
}

//@property (nonatomic, copy) NSString *_name, *_email;

-(void)setName:(NSString *)name;
-(void)setBirthdate:(NSDate *)birthdate;
-(void)setEmail:(NSString *)email;
-(NSString *)name;
-(NSDate *)birthdate;
-(NSString *)email;
-(NSString *)description;
-(void)print;

@end
