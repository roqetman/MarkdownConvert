//
//  MDCAppDelegate.m
//  Markdown Convert
//
//  Created by Dominic Kraetschmer on 11/12/12.
//  Copyright (c) 2012 roqet. All rights reserved.
//

#import "MDCAppDelegate.h"

@implementation MDCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    MDCAppDelegate *appdelegate1= (MDCAppDelegate *)[[UIApplication sharedApplication] delegate];
    // set css defaults
    NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
    NSString *switchString = [data objectForKey:@"use_css"];
    //NSLog(@"in init: %@", switchString);
    
    if (switchString == [NSString stringWithFormat:@"OFF"]) {
        appdelegate1.usingCSS = NO;
    }
    else {
        appdelegate1.usingCSS = YES;
    }
    
    //NSLog(@"in init: %d", appdelegate1.usingCSS);
    //NSLog(@"in init: %@", appdelegate1.usingCSS ? @"YES" : @"NO");
    
    NSString *cssPath = [[NSBundle mainBundle] pathForResource:@"style"                                                        ofType:@"css"];
    NSData *cssData = [NSData dataWithContentsOfFile:cssPath];
    
    appdelegate1.cssRawText= [[NSString alloc] initWithData:cssData                                                encoding:NSASCIIStringEncoding];;
    // load markdown if this app was launched from another app
    NSURL *url = (NSURL *)[launchOptions valueForKey:UIApplicationLaunchOptionsURLKey];
    if (url != nil)
    {
        appdelegate1.markdownFromExternal = YES;
        appdelegate1.markdownRawText= [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        //NSLog(@"The file contained: %@",appdelegate1.markdownRawText);
    }
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
