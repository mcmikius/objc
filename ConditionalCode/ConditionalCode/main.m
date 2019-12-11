//
//  main.m
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 09.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "myClass.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        // insert code here...
        myClass * one = [[myClass alloc] init];
        
        [ one setAlpha:7];
        
        NSLog(@"alpha is %i", [ one alpha]);
        
    }
    return 0;
}

