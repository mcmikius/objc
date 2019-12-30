//
//  AppDelegate.h
//  AwesomeRandom
//
//  Created by Mykhailo Bondarenko on 30.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    
    IBOutlet NSTextField *textField;
    
}




- (IBAction)generate:(id)sender;
- (IBAction)seed:(id)sender;

@end

