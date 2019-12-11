//
//  simpleClass.h
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 11.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface simpleClass : NSObject {
@private
    int alpha;
}
-(id)initWithAlpha:(int) a;

@property int alpha;

@end

NS_ASSUME_NONNULL_END
