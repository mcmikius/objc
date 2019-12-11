//
//  main.m
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 09.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "simpleClass.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        // insert code here...
        simpleClass * obj = [[simpleClass alloc] init];
        NSLog(@"%@", obj);
    }
    return 0;
}
 
