//
//  myClass.h
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 11.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myClass : NSObject {
@private
    int alpha;
    int beta;
}

-(void) alphaOut;

-(int) alpha;

-(void) setAlpha: (int) a;

@end
