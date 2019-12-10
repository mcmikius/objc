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
        for (int i = 1; i < 15; i++) {
            if (i % 3 == 0) {
                continue;
            }
            NSLog(@"i = %i", i);
        }
    }
    return 0;
}

