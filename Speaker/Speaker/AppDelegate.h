//
//  AppDelegate.h
//  Speaker
//
//  Created by Mykhailo Bondarenko on 30.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSSpeechSynthesizer *speaker;
    
}

@property (weak) IBOutlet NSTextField *textField;

- (IBAction)speakIt:(id)sender;
- (IBAction)stopIt:(id)sender;

@end

