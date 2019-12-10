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
        switch (alpha) {
            case 'b': NSLog(@"It's b!");
                break;
            case 'c': NSLog(@"It's c!");
                break;
            case 'd': NSLog(@"It's d!");
                break;
            default: NSLog(@"It's not b, c, d!");
        }
        return 0;
    }
}
