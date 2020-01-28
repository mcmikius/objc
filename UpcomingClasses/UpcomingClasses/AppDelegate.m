//
//  AppDelegate.m
//  UpcomingClasses
//
//  Created by Mykhailo Bondarenko on 28.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import "AppDelegate.h"
#import "ScheduledFetcher.h"
#import "ScheduledClass.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [tableView setTarget:self];
    [tableView setDoubleAction:@selector(openClass)];
    
    ScheduledFetcher *fetcher = [[ScheduledFetcher alloc]init];
    NSError *error = nil;
    classes = [fetcher fetchClassesWithError:&error];
    [tableView reloadData];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(void)openClass:(id)sender {
    ScheduledClass *c = [classes objectAtIndex:[tableView clickedRow]];
    NSURL *baseURL = [NSURL URLWithString:@"http://bignerdranch.com/"];
    NSURL *url = [NSURL URLWithString:[c href] relativeToURL:baseURL];
    
    [[NSWorkspace sharedWorkspace] openURL:url];
}

- (NSInteger) numberOfRowsInTableView:(NSTableView*)theTableView {
    return [classes count];
}

-(id)tableView:(NSTableView*)theTableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    ScheduledClass *c = [classes objectAtIndex:row];
    return [c valueForKey:[tableColumn identifier]];
}

@end
