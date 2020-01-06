//
//  Person.m
//  EmployeeDatabase
//
//  Created by Mykhailo Bondarenko on 06.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id) init {
    if (self = [super init]) {
        _name = @"Unnamed Person";
        _raise = 0.1;
    }
    return self;
}
@end
