//
//  AppDelegate.h
//  TemperatureBinder
//
//  Created by Mykhailo Bondarenko on 06.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSInteger temperature;
}

@property (weak) IBOutlet NSTextField *label;
- (IBAction)increment:(id)sender;


@end

