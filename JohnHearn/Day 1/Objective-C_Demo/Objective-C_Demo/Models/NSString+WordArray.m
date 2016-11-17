//
//  NSString+WordArray.m
//  Objective-C_Demo
//
//  Created by John D Hearn on 11/14/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import "NSString+WordArray.h"

@implementation NSString (WordArray)

-(NSArray *)asWordArray{
    return [self componentsSeparatedByString:@" "];
}

@end
