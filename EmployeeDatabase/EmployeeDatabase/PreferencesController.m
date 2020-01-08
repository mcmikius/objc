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
NSString *const MCColorChangeNotification = @"MCColorChangeNotification";

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
    
    [colorWell setColor:[PreferencesController preferenceTableBgColor]];
    [checkBox setState:[PreferencesController preferenceEmptyDoc]];
}

+ (NSColor*)preferenceTableBgColor {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *colorAsData = [defaults objectForKey:MCTableBgColorKey];
    return [NSKeyedUnarchiver unarchiveObjectWithData:colorAsData];
}

+ (void)setPreferenceTableBgColor:(NSColor *)color {
    NSData *colorAsData = [NSKeyedArchiver archivedDataWithRootObject:color];
    [[NSUserDefaults standardUserDefaults] setObject:colorAsData forKey:MCTableBgColorKey];
}

+ (BOOL)preferenceEmptyDoc {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:MCEmptyDocKey];
}

+ (void)setPreferenceEmptyDoc:(BOOL)emptyDoc {
    [[NSUserDefaults standardUserDefaults] setBool:emptyDoc forKey:MCEmptyDocKey];
}

- (IBAction)changedBackgroundColor:(id)sender {
    [PreferencesController setPreferenceTableBgColor:[colorWell color]];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[colorWell color] forKey:@"color"];
    [notificationCenter postNotificationName:MCColorChangeNotification object:self userInfo:dictionary];
}
- (IBAction)changeNewEmptyDoc:(id)sender {
    [PreferencesController setPreferenceEmptyDoc:[checkBox state]];
}

@end
