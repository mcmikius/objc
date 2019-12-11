//
//  NSString+removeDigits.m
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 11.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import "NSString+removeDigits.h"

@implementation NSString (removeDigits)
-(NSString *) removeDigits {
    NSCharacterSet * digits = [NSCharacterSet decimalDigitCharacterSet];
    return [self stringByTrimmingCharactersInSet:digits];
}
@end
