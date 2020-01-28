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
}

- (void)prepareAttributes;
- (IBAction)savePDF:(id)sender;

@property (strong) NSColor *bgColor;
@property (copy) NSString *string;

@end

NS_ASSUME_NONNULL_END
