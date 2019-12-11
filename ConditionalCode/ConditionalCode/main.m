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
        
        int array[5] = { 6, 55, 707, -6, 0 };
        NSLog(@"The 3th is %i", array[2]);
        
        NSString * book[5] = {@"z", @"x", @"c", @"v", @"b"};
        while (array[0]) {
            NSLog(@"%@", book[array[0]--]);
        }
    }
    return 0;
}

