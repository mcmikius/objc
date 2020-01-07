//
//  AppController.m
//  EmployeeDatabase
//
//  Created by Mykhailo Bondarenko on 07.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import "AppController.h"
#import "PreferencesController.h"

@implementation AppController

-(IBAction) showPreferencesPanel:(id)sender {
    if (!preferences) {
        preferences = [[PreferencesController alloc] init];
        
    }
    [preferences showWindow: self];
}

@end
