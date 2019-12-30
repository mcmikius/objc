//
//  AppDelegate.m
//  AwesomeRandom
//
//  Created by Mykhailo Bondarenko on 30.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(IBAction)seed:(id)sender {
    srandom((unsigned)time(NULL));
}
-(IBAction)generate:(id)sender {
    int num = (int)((random() % 100) + 1);
    [textField setIntValue:num];
}

@end
