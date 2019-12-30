//
//  main.m
//  HiWeeObjc
//
//  Created by Mykhailo Bondarenko on 15.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface Fraction () {
    NSString *name;
}

- (void) add: (Fraction *) f;

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Fraction *myFraction, *myFraction2;
        myFraction = [[Fraction alloc] init];
        myFraction2 = [[Fraction alloc] init];
        
        [myFraction setNumerator:10];
        [myFraction setDenominator:22];
        
        [myFraction2 setNumerator:5];
        [myFraction2 setDenominator:6];
        
        [myFraction add: myFraction2];
        
        [myFraction print];
    }
    return 0;
}
