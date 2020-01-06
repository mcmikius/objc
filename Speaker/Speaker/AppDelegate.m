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
    [speaker setDelegate:self];
    voices = [NSSpeechSynthesizer availableVoices];
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

- (void) tableViewSelectionDidChange: (NSNotification *)notification {
    NSInteger row = [_tableView selectedRow];
    if (row == -1) { return; }
    NSString *selectedVoice = [voices objectAtIndex:row];
    [speaker setVoice:selectedVoice];
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking {
    [_textField setStringValue:@""];
}

- (NSInteger)numberOfRowsInTableView: (NSTableView*) tableView {
    return (NSInteger)[[NSSpeechSynthesizer availableVoices] count];
}

- (id) tableView: (NSTableView*) tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *view = [voices objectAtIndex:row];
    return view;
}

@end
