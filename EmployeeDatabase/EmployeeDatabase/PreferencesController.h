//
//  PreferencesController.h
//  EmployeeDatabase
//
//  Created by Mykhailo Bondarenko on 07.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *const MCTableBgColorKey;
extern NSString *const MCEmptyDocKey;

extern NSString *const MCColorChangeNotification;

@interface PreferencesController : NSWindowController {
    IBOutlet NSColorWell *colorWell;
    __weak IBOutlet NSButton *checkBox;
    
}

+ (NSColor *)preferenceTableBgColor;
+ (void)setPreferenceTableBgColor:(NSColor*)color;
+ (BOOL)preferenceEmptyDoc;
+ (void)setPreferenceEmptyDoc:(BOOL)emptyDoc;

- (IBAction)changedBackgroundColor:(id)sender;
- (IBAction)changeNewEmptyDoc:(id)sender;


@end

NS_ASSUME_NONNULL_END
