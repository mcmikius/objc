//
//  main.m
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 09.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>


int main(int argc, const char * argv[]) {
    
    typedef int proInt;
    proInt x = 36;
    x = x / 6;
    
    typedef enum { bannana, apple, orange } fruits;
    
    @autoreleasepool {
        // insert code here...
        
        fruits juice = apple;
        fruits iDontLike = orange;
       
        NSLog(@"juice = %i iDontLike %i", juice, iDontLike);
        
        
    }
    return 0;
}

