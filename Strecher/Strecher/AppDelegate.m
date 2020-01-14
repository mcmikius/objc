//
//  AppDelegate.m
//  Strecher
//
//  Created by Mykhailo Bondarenko on 13.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import "AppDelegate.h"
#import "StretchView.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSView *superView = [_window contentView];
    NSRect frame = NSMakeRect(10, 10, 120, 120);
    NSButton *button = [[NSButton alloc]initWithFrame:frame];
    [button setTitle:@"Goodbye!"];
    [superView addSubview:button];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)showOpenPanel:(id)sender {
    __block NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setAllowedFileTypes:[NSImage imageTypes]];
    [panel beginSheetModalForWindow:[stretchView window] completionHandler:^(NSInteger result) {
        if (result == NSModalResponseOK) {
            NSImage *image = [[NSImage alloc] initWithContentsOfURL:[panel URL]];
            [self->stretchView setImage: image];
        }
        panel = nil;
    }];
}


@end
