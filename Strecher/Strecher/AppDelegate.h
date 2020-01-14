//
//  AppDelegate.h
//  Strecher
//
//  Created by Mykhailo Bondarenko on 13.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class StretchView;

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet StretchView *stretchView;
}

- (IBAction)showOpenPanel:(id)sender;

@end

