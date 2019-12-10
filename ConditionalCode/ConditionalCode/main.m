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
        enum fruits { bannana, apple, orange };
        enum fruits juice = apple;
        enum fruits iDontLike = orange;
       
        NSLog(@"juice = %i iDontLike %i", juice, iDontLike);
        
        
    }
    return 0;
}

