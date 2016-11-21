//
//  StudentStore.m
//  ClassRoster
//
//  A composite class singleton extending NSMutableDictionary
//
//  Created by John D Hearn on 11/16/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//


#import "StudentStore.h"


@interface StudentStore ()
@property(strong, nonatomic)NSMutableDictionary *students;
@end

@implementation StudentStore

// Needed to be a singleton
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

        [self addObserver:self
               forKeyPath:@"students"
                  options:NSKeyValueObservingOptionNew
                  context:&kvoContext];
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
    return [studentsArray sortedArrayUsingSelector:@selector(compare:)];
}

-(void)add:(Student *)student{
    if(![self.students objectForKey:student.email]){
        [self willChangeValueForKey:@"students"];
        [self.students setObject:student forKey:student.email];
        [self didChangeValueForKey:@"students"];
    }
}

-(void)remove:(Student *)student{
    if([self.students objectForKey:student.email]){
        [self willChangeValueForKey:@"students"];
        [self.students setObject:student forKey:student.email];
        [self didChangeValueForKey:@"students"];
    }
}

-(void)save{
    BOOL success = [NSKeyedArchiver archiveRootObject:self.students toFile:self.archiveURL.path];
    NSLog(@"Success saving: %i", success);
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context{
    NSLog(@"\n\nObserver Fired!\n\n");
    if(context == kvoContext){
        NSLog(@"\n\nObserver Fired in StudentStore!\n\n");
        [self save];
    } else {
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
}

+(BOOL)automaticallyNotifiesObserversOfStudents{
    return NO;
}

-(NSURL *)archiveURL{
    NSURL *documentsDirectory =
    [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                            inDomains:NSUserDomainMask] firstObject];

    NSURL *archiveURL = [documentsDirectory URLByAppendingPathComponent:@"archive"];
    return archiveURL;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"students"];
}

@end





