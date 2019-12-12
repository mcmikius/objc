//
//  security.h
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 12.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol security <NSObject>

@required
-(void) protectStaff;
-(void) protectStuff;

@optional
-(void) changeLights;

@end
