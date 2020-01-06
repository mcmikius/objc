//
//  AppDelegate.m
//  TemperatureBinder
//
//  Created by Mykhailo Bondarenko on 06.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
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

- (id) init {
    self = [super init];
    if (self) {
        [self setValue: [NSNumber numberWithInt:0] forKey:@"temperature"];
    }
    return self;
}

- (void) setTemperature: (int) x {
    [_label setStringValue:[NSString stringWithFormat:@"%d", x]];
    temperature = x;
}

- (NSInteger) temperature {
    return temperature;
}

- (IBAction)increment:(id)sender {
    [self willChangeValueForKey:@"temperature"];
    [self setTemperature:[self temperature]+1];
    [self didChangeValueForKey:@"temperature"];
}

@end
