//
//  main.m
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 09.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

void loop(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        loop();
    }
    return 0;
}

void loop() {
    for (int i = 1; i < 15; i++) {
        if (i % 3 == 0) {
            continue;
        }
        NSLog(@"i = %i", i);
    }
}
