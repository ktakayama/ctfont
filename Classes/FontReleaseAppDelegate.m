//
//  FontReleaseAppDelegate.m
//  FontRelease
//
//  Created by Kyosuke Takayama on 10/11/25.
//  Copyright 2010 aill. All rights reserved.
//

#import "FontReleaseAppDelegate.h"
#import "MyFont.h"

#include <mach/mach.h>

extern void showMemoryUsage(void) {
   struct task_basic_info t_info;
   mach_msg_type_number_t t_info_count = TASK_BASIC_INFO_COUNT;

   if (task_info(current_task(), TASK_BASIC_INFO, (task_info_t)&t_info, &t_info_count)!= KERN_SUCCESS) {
      NSLog(@"%s(): Error in task_info(): %s",
            __FUNCTION__, strerror(errno));
   }

   // 物理メモリの使用量(byte) - Activity MonitorのReal Memoryに該当
   u_int rss = t_info.resident_size / 1024.0;
   u_int l_pos = round(rss / 1000);
   u_int r_pos = rss - (l_pos * 1000);

   NSLog(@"RSS: %u,%03u MBytes.", l_pos, r_pos);
}

@implementation FontReleaseAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
    [self.window makeKeyAndVisible];
    
    [self performSelector:@selector(cycle) withObject:nil afterDelay:1.0f];
    return YES;
}

- (void) cycle {
   MyFont *font = [[MyFont alloc] init];
   [font release];
   showMemoryUsage();
   [self performSelector:@selector(cycle) withObject:nil afterDelay:1.0f];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
