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
        char alpha = 'd';
        if (alpha == 'b') {
            NSLog(@"It's b !!!");
        } else if (alpha == 'c') {
            NSLog(@"It's not b it's c !!!");
        } else if (alpha == 'd') {
            NSLog(@"It's d !!!");
        }
    }
    return 0;
}
