//
//  simpleClass.m
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 11.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import "simpleClass.h"

@implementation simpleClass

@synthesize alpha;

-(id) initWithAlpha: (int) a {
    self = [super init];
    if (self) {
        alpha = a;
    }
    return self;
}

-(id) init {
    self = [super init];
    if (self) {
        alpha = -56;
    }
    return self;
}
@end
