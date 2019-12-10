//
//  main.m
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 09.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        float f = 3.14f;
        double d = 3.14;
        NSLog(@"f = %f", f);
        NSLog(@"f = %e", f);
        NSLog(@"d = %e", d);
        NSLog(@"d = %g", d);
    }
    return 0;
}

