//
//  main.m
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 09.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+removeDigits.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        // insert code here...
        NSString * string = @"123abc 678";
        NSLog(@"%@", [string removeDigits]);
    }
    return 0;
}
 
