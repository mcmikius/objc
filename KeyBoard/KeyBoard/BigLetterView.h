//
//  BigLetterView.h
//  KeyBoard
//
//  Created by Mykhailo Bondarenko on 27.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface BigLetterView : NSView {
    NSColor *bgColor;
    NSString *string;
    NSMutableDictionary *attr;
    NSEvent *mouseDownEvent;
}

- (void)prepareAttributes;
- (IBAction)savePDF:(id)sender;

- (IBAction)cut:(id)sender;
- (IBAction)copy:(id)sender;
- (IBAction)paste:(id)sender;



@property (strong) NSColor *bgColor;
@property (copy) NSString *string;

@end

NS_ASSUME_NONNULL_END
