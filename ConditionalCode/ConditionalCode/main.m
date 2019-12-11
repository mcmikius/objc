//
//  main.m
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 09.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        // insert code here...
        Car * ford = [[Car alloc]init];
        [ford setName:@"Ford"];
        [ford setEngCap: 10.8];
        NSLog(@"%@", [ford description]);
        [NSKeyedArchiver archiveRootObject:ford toFile:@"/Users/mykhailobondarenko/Documents/ford.plist"];
        Car * newFord = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/mykhailobondarenko/Documents/ford.plist"];
        NSLog(@"%@", [newFord description]);
    }
    return 0;
}
 
