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
        NSMutableDictionary * aeroports = [ NSMutableDictionary dictionaryWithObjectsAndKeys:
                                           @"Zhulany", @"KIE",
                                           @"Boryspol", @"BOR",
                                           @"Dnipro", @"DNP",
                                           @"Kharkiv", @"KHA",nil];
        [aeroports setObject:@"Gatwick" forKey:@"LGW"];
        for (NSString * aeroportsAbbrev in aeroports) {
            NSLog(@"%@ is %@", aeroportsAbbrev, [aeroports objectForKey:aeroportsAbbrev]);
        }
        
    }
    return 0;
}

