//
//  main.m
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 09.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

int global = 3;

void print(int value) {
    global++;
    NSLog(@"Value = %i", value);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        for (int i = 1; i < 10; i++) {
            int foo = 55;
            global--;
            print(foo);
            NSLog(@" foo = %i", foo);
        }
    }
    return 0;
}

