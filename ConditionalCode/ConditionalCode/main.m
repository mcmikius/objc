//
//  main.m
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 09.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#define MAXSIZE 8000

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        // insert code here...
        int a = MAXSIZE + 500;
        a++;
        NSLog(@"maxsize = %i", a);
#if DEBUG
        NSLog(@"The biggest of int = %i", INT_MAX);
#endif
    }
    return 0;
}

