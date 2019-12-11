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
        NSString * name = @"Johannes Chrysostomus Wolfgangus Theophilus Mozart";
        unsigned long count = [ name length ];
        NSLog(@"The length of full Mozart's name is %lu", count);
        
        NSDate * today = [NSDate date];
        NSLog(@"Today is %@", today);
        
    }
    return 0;
}

