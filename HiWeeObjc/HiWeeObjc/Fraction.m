//
//  Fraction.m
//  HiWeeObjc
//
//  Created by Mykhailo Bondarenko on 15.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

- (void)print {
    NSLog(@"%i / %i", _numerator, _denominator);
}

- (void)add: (Fraction *) f {
    [self setNumerator:self.numerator * f.denominator + self.denominator * f.numerator];
    [self setDenominator:self.denominator * f.denominator];
}

- (void)doubleNumber {
    [self setNumerator:self.numerator * 2];
    [self setDenominator:self.denominator *2];
}

@end
