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
        [self prepareAttributes];
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
    [self drawStringCenteredIn:bound];
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

- (void)drawStringCenteredIn:(NSRect)r {
    NSSize strSize = [string sizeWithAttributes:attr];
    NSPoint strOrigin;
    strOrigin.x = r.origin.x + (r.size.width - strSize.width)/2;
    strOrigin.y = r.origin.y + (r.size.height - strSize.height)/2;
    [string drawAtPoint:strOrigin withAttributes:attr];
}

- (void)prepareAttributes {
    attr = [NSMutableDictionary dictionary];
    [attr setObject:[NSFont userFontOfSize:80] forKey:NSFontAttributeName];
    [attr setObject:[NSColor yellowColor] forKey:NSForegroundColorAttributeName];
}

- (IBAction)savePDF:(id)sender {
    __block NSSavePanel *panel = [NSSavePanel savePanel];
    [panel setAllowedFileTypes:[NSArray arrayWithObject:@"pdf"]];
    [panel beginSheetModalForWindow:[self window] completionHandler:^(NSInteger result) {
        if (result == NSModalResponseOK) {
            NSRect r = [self bounds];
            NSData *data = [self dataWithPDFInsideRect: r];
            NSError *error;
            BOOL succesful = [data writeToURL:[panel URL] options:0 error:& error];
            if (!succesful) {
                NSAlert *alert = [NSAlert alertWithError:error];
                [alert runModal];
            }
        }
        panel = nil;
    }];
}

@end
