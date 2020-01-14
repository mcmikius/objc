//
//  StretchView.m
//  Strecher
//
//  Created by Mykhailo Bondarenko on 13.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import "StretchView.h"

@implementation StretchView

- (id)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        opacity = 1.0;
        srandom((unsigned)time(NULL));
        path = [NSBezierPath bezierPath];
        [path setLineWidth:3.0];
        NSPoint point = [self randomPoint];
        [path moveToPoint:point];
        int i;
        for (i=0; i < 14; i++) {
            point = [self randomPoint];
            [path lineToPoint:point];
        }
        [path closePath];
    }
    return self;
}

- (float)opacity {
    return opacity;
}

- (void)setOpacity:(float)x {
    opacity = x;
    [self setNeedsDisplay:YES];
}

- (NSImage*) image {
    return image;
}

- (void) setImage:(NSImage*)newImage {
    image = newImage;
    NSSize imageSize = [newImage size];
    downPoint = NSZeroPoint;
    currentPoint.x = downPoint.x + imageSize.width;
    currentPoint.y = downPoint.y + imageSize.height;
    [self setNeedsDisplay:YES];
}

- (NSPoint) randomPoint {
    NSPoint result;
    NSRect rect = [self bounds];
    result.x = rect.origin.x + random() % (int)rect.size.width;
    result.y = rect.origin.y + random() % (int)rect.size.height;
    return result;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSRect bounds = [self bounds];
    [[NSColor greenColor] set];
    [NSBezierPath fillRect:bounds];
    [[NSColor whiteColor]set];
    [path fill];
    
    if (image) {
        
        NSRect imageRect;
        imageRect.origin = NSZeroPoint;
        imageRect.size = [image size];
        NSRect drawingRect = [self currentRect];
        [image drawInRect:drawingRect fromRect:imageRect operation:NSCompositingOperationSourceOver fraction:opacity];
    }
}

- (void)mouseDown:(NSEvent *)event {
    NSPoint p = [event locationInWindow];
    downPoint = [self convertPoint:p fromView:nil];
    currentPoint = downPoint;
    [self setNeedsDisplay:YES];
}

- (void)mouseDragged:(NSEvent *)event {
    NSPoint p = [event locationInWindow];
    currentPoint = [self convertPoint:p fromView:nil];
    [self setNeedsDisplay:YES];
}

- (void)mouseUp:(NSEvent *)event {
    NSPoint p = [event locationInWindow];
    currentPoint = [self convertPoint:p fromView:nil];
    [self setNeedsDisplay:YES];
}

- (NSRect)currentRect {
    float minX = MIN(downPoint.x, currentPoint.x);
    float maxX = MAX(downPoint.x, currentPoint.x);
    float minY = MIN(downPoint.y, currentPoint.y);
    float maxY = MAX(downPoint.y, currentPoint.y);
    return NSMakeRect(minX, minY, maxX, maxY);
}

@end
