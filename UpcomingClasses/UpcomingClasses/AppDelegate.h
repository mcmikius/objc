//
//  AppDelegate.h
//  UpcomingClasses
//
//  Created by Mykhailo Bondarenko on 28.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet NSTableView *tableView;
    NSArray *classes;
}


@end

