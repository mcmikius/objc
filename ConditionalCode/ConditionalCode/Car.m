//
//  Car.m
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 11.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import "Car.h"

@implementation Car
@synthesize name, engCap;
-(void) encodeWithCoder: (NSCoder *) coder {
    [coder encodeObject:name forKey:@"CARname"];
    NSNumber * engCapObj = [NSNumber numberWithFloat:engCap];
    [coder encodeObject:engCapObj forKey:@"CARengCap"];
}

-(id) initWithCoder:(NSCoder *) coder {
    name = [ [coder decodeObjectForKey:@"CARname"] retain];
    NSNumber * engCapObj = [coder decodeObjectForKey:@"CARengCap"];
    engCap = (float) [engCapObj floatValue];
    return self;
}

-(NSString *) description {
    NSString * description = [NSString stringWithFormat:@"The engine capacity of %@ is %f liter", name, engCap];
    return description;
}
@end
