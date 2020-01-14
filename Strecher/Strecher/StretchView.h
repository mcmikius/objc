//
//  StretchView.h
//  Strecher
//
//  Created by Mykhailo Bondarenko on 13.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface StretchView : NSView {
    NSBezierPath *path;
    NSImage *image;
    float opacity;
}

- (NSPoint) randomPoint;
@property (assign) float opacity;
@property (strong) NSImage *image;

@end

NS_ASSUME_NONNULL_END
