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
        NSDate * myDate = [[NSDate alloc] init];
        NSMutableArray * myArray = [[NSMutableArray alloc] initWithObjects:@"it", @"is Xcode", myDate, nil];
        NSLog(@"The first element is %@", [myArray objectAtIndex:2]);
        
        [myArray addObject:@"Yeah!"];
        [myArray removeObjectAtIndex:1];
        NSLog(@"The first element is %@ and the length is %lu", [myArray objectAtIndex:2], [myArray count]);
    }
    return 0;
}

