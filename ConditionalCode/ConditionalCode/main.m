//
//  main.m
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 09.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

void myFunc (NSString * f) {
    NSLog(@" %@ is strong", f);
}

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        // insert code here...
        NSString * name = @"Arnold";
        myFunc(name);
    }
    return 0;
}

