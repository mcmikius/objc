//
//  BigLetterView.m
//  KeyBoard
//
//  Created by Mykhailo Bondarenko on 27.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import "BigLetterView.h"

@implementation BigLetterView

- (id) initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        bgColor = [NSColor blueColor];
        string = @"";
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSRect bound = [self bounds];
    [bgColor set];
    [NSBezierPath fillRect:bound];
    if ([[self window]firstResponder] == self) {
        [[NSColor keyboardFocusIndicatorColor]set];
        [NSBezierPath setDefaultLineWidth:5.0];
        [NSBezierPath strokeRect:bound];
    }
}

- (BOOL)isOpaque {return YES;}
- (BOOL)acceptsFirstResponder {return YES;}
- (BOOL)resignFirstResponder {return YES;}
- (BOOL)becomeFirstResponder {return YES;}

- (void)keyDown:(NSEvent *)event {
    [self interpretKeyEvents:[NSArray arrayWithObject:event]];
}

- (void)insertText:(id)insertString {
    [self setString:insertString];
    
}

- (void)insertTab:(id)sender {
    [[self window] selectKeyViewFollowingView:self];
}

- (void)setBgColor:(NSColor *)newColor {
    bgColor = newColor;
    [self setNeedsDisplay:YES];
}

- (NSColor*)bgColor {
    return bgColor;
    
}

- (void)setString:(NSString *)newString {
    string = newString;
    NSLog(@"%@", string);
    [self setNeedsDisplay:YES];
}
- (NSString *)string {
    return string;
}

@end
