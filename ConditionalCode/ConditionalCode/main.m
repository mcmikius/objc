//
//  main.m
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 09.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface car : NSObject {
    @private
    NSString * brand;
    NSDate * productionDate;
    
    
}

- (void) print;

@end

@implementation car

- (void) print {
    NSLog(@" \n Brand is %@. \n Date of production is %@. \n", brand, productionDate);
}

@end

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        // insert code here...
        
        car * Lada = [[car alloc] init];
        [Lada print];
        
    }
    return 0;
}

