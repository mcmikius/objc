//
//  Fraction.h
//  HiWeeObjc
//
//  Created by Mykhailo Bondarenko on 15.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "numbersProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface Fraction : NSObject <numbersProtocol>

@property int numerator, denominator;

- (void) print;

@end

NS_ASSUME_NONNULL_END
