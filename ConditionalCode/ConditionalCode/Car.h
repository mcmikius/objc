//
//  Car.h
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 11.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Car : NSObject {
@private
NSString * name;
float engCap;
}
@property (retain) NSString * name;
@property float engCap;
@end

NS_ASSUME_NONNULL_END
