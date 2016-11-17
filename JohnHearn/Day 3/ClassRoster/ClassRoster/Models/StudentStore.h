//
//  StudentStore.h
//  ClassRoster
//
//  Created by John D Hearn on 11/16/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface StudentStore : NSObject

+(instancetype)shared;
//-(instancetype)init;
-(NSInteger)count;
-(NSArray *)allStudents;
-(void)add:(Student *)student;
-(void)remove:(Student *)student;
-(void)save;

@end
