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
        NSURL * myMain = [NSURL fileURLWithPath:@"/Users/mykhailobondarenko/Developer/objc/ConditionalCode/ConditionalCode/main.m"];
        NSString * content = [NSString stringWithContentsOfURL:myMain encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"The text is %@", content);
    }
    return 0;
}

