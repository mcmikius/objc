//
//  AppController.h
//  EmployeeDatabase
//
//  Created by Mykhailo Bondarenko on 07.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PreferencesController;

NS_ASSUME_NONNULL_BEGIN

@interface AppController : NSObject {
    PreferencesController *preferences;
}

- (IBAction)showPreferencesPanel:(id)sender;

@end

NS_ASSUME_NONNULL_END
