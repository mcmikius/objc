//
//  main.m
//  HiWeeObjc
//
//  Created by Mykhailo Bondarenko on 15.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Fraction *myFraction;
        myFraction = [[Fraction alloc] init];
        
        [myFraction setNumerator:10];
        [myFraction setDenominator:20];
        [myFraction print];
    }
    return 0;
}
