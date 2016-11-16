//
//  StudentStore.m
//  ClassRoster
//
//  Created by John D Hearn on 11/16/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import "StudentStore.h"

@interface StudentStore ()
@property(strong, nonatomic)NSMutableDictionary *students;
@end

@implementation StudentStore

+(instancetype)shared{
    static StudentStore *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[StudentStore alloc] init];
    });

    return shared;
}

-(instancetype)init{
    self = [super init];
    if(self){

        self.students = [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfURL:self.archiveURL]];

        if(!self.students){
            self.students = [[NSMutableDictionary alloc] init];
        }

    }
    return self;
}


-(NSInteger)count{
    return self.students.count;
}

-(NSArray *)allStudents{
    NSMutableArray *studentsArray = [[NSMutableArray alloc] init];
    for(Student *student in self.students.allValues){
        [studentsArray addObject:[student copy]];

    }
    return studentsArray;
}

-(void)add:(Student *)student{
    [self.students setObject:student forKey:student.email];
    [self save];

}

-(void)remove:(Student *)student{
    [self.students removeObjectForKey:student.email];
    [self save];
}

-(void)save{



    BOOL success = [NSKeyedArchiver archiveRootObject:self.students toFile:self.archiveURL.path];

    NSLog(@"Success saving: %i", success);
}

-(NSURL *)archiveURL{
    NSURL *documentsDirectory =
    [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                            inDomains:NSUserDomainMask] firstObject];

    NSURL *archiveURL = [documentsDirectory URLByAppendingPathComponent:@"archive"];
    return archiveURL;
}

@end





