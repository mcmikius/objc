//
//  PreferencesController.m
//  EmployeeDatabase
//
//  Created by Mykhailo Bondarenko on 07.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import "PreferencesController.h"

@interface PreferencesController ()

@end

@implementation PreferencesController

NSString *const MCTableBgColorKey = @"MCTableBgColorKey";
NSString *const MCEmptyDocKey = @"MCEmptyDocKey";

+ (void) initialize {
    NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];
    NSData *colorAsData = [NSKeyedArchiver archivedDataWithRootObject:[NSColor yellowColor]];
    [defaultValues setObject:colorAsData forKey:MCTableBgColorKey];
    [defaultValues setObject:[NSNumber numberWithBool:YES] forKey:MCEmptyDocKey];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultValues];
}

- (id) init {
    self = [super initWithWindowNibName:@"Preferences"];
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)changedBackgroundColor:(id)sender {
    
}

@end
