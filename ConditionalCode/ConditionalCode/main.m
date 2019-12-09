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
        char q = 'q';
        int a = 10;
        if (q == 'q' || a > 50) {
            NSLog(@"Qu is Qu");
        } else {
            NSLog(@"Qu is not Qu");
        }
    }
    return 0;
}
