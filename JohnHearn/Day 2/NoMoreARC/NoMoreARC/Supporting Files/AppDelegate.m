//
//  AppDelegate.m
//  NoMoreARC
//
//  Created by John D Hearn on 11/15/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import "AppDelegate.h"
#import "../Models/User.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    User *adam = [[User alloc] init];
    NSDate *adamsBirthday = [self dateFromString:@"01/01/1982"];
    [adam setName:@"Adam"];
    [adam setBirthdate:adamsBirthday];
    [adam setEmail:@"adam@codfallows.com"];
    //[adamsBirthday release];
    NSLog(@"%@", adam.description);
    [adam print];

    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setObject:adam forKey:[adam email]];


    NSDate *davesBirthday = [self dateFromString:@"01/01/1962"];
    User *dave = [[User alloc] initWithName:@"Dave"
                               andBirthdate:davesBirthday
                                   andEmail:@"dave@codfallows.com"];
    //[davesBirthday release];
    [dictionary setObject:dave forKey:[dave email]];

    NSDate *brooksBirthday = [self dateFromString:@"06/06/1979"];
    User *brook = [[User alloc] initWithName:@"Brook"
                                andBirthdate:brooksBirthday
                                    andEmail:@"brook@codfallows.com"];
    //[brooksBirthday release];
    [dictionary setObject:brook forKey:[brook email]];


    NSDate *brandysBirthday = [self dateFromString:@"12/12/1973"];
    User *brandy = [[User alloc] initWithName:@"Brandy"
                               andBirthdate:brandysBirthday
                                   andEmail:@"brandy@codfallows.com"];
    //[brandysBirthday release];
    [dictionary setObject:brandy forKey:[brandy email]];


    NSDate *romansBirthday = [self dateFromString:@"11/11/1988"];
    User *roman = [[User alloc] initWithName:@"Roman"
                                 andBirthdate:romansBirthday
                                     andEmail:@"roman@codfallows.com"];
    //[romansBirthday release];
    [dictionary setObject:roman forKey:[roman email]];

    NSLog(@"%@", dictionary.description);

    [dictionary release];
    [adam release];
    [dave release];
    [brook release];
    [brandy release];
    [roman release];


    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


/* Private Helper Methods */
-(NSDate *)dateFromString:(NSString *)string{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    NSDate* date = [formatter dateFromString:string];
    [formatter release];
    [date autorelease];
    NSLog(@"%@", date);

    return date;
}



@end
