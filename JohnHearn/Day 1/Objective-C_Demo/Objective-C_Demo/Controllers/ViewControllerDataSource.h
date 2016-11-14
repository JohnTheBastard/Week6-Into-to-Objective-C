//
//  ViewControllerDataSource.h
//  Objective-C_Demo
//
//  Created by John D Hearn on 11/14/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ViewControllerDataSource <NSObject>

@required
-(void)numberOfCellsForTableView;

@optional
-(NSString *)doSomeStuffWithOptionalMethod;

@end
