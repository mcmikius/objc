//
//  AppDelegate.m
//  Speaker
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
    speaker = [[NSSpeechSynthesizer alloc] initWithVoice:NULL];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (IBAction)speakIt:(id)sender {
    [speaker startSpeakingString:[_textField stringValue]];
    
}

- (IBAction)stopIt:(id)sender {
    [speaker stopSpeaking];
}

@end
