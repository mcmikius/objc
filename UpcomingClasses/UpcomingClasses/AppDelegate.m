//
//  AppDelegate.m
//  UpcomingClasses
//
//  Created by Mykhailo Bondarenko on 28.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import "AppDelegate.h"
#import "ScheduledFetcher.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    ScheduledFetcher *fetcher = [[ScheduledFetcher alloc]init];
    NSError *error = nil;
    [fetcher fetchClassesWithError:&error];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
