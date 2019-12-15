//
//  Fraction.h
//  HiWeeObjc
//
//  Created by Mykhailo Bondarenko on 15.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Fraction : NSObject

@property int numerator, denominator;

- (void) print;
-(void) setNumerator: (int) n;
-(void) setDenominator: (int) d;

@end

NS_ASSUME_NONNULL_END
