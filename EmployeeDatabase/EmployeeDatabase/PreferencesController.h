//
//  PreferencesController.h
//  EmployeeDatabase
//
//  Created by Mykhailo Bondarenko on 07.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface PreferencesController : NSWindowController {
    IBOutlet NSColorWell *colorWell;
    
}

- (IBAction)changedBackgroundColor:(id)sender;

@end

NS_ASSUME_NONNULL_END
