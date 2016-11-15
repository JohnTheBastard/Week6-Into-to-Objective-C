//
//  AddressCard.h
//  NoMoreARC
//
//  Created by John D Hearn on 11/15/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressCard : NSObject

@property (nonatomic, copy) NSString *_name, *_email;

-(void)setName:(NSString *)name;
-(void)setEmail:(NSString *)email;
-(NSString *)name;
-(NSString *)email;
-(NSString *)description;
-(void)print;

@end
