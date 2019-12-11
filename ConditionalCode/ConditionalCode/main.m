//
//  main.m
//  ConditionalCode
//
//  Created by Mykhailo Bondarenko on 09.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>


int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        // insert code here...
        NSFileManager * fm = [[NSFileManager alloc] init];
        NSString * path = @"/Users/mykhailobondarenko/Developer/objc/README.md";
        if ([fm fileExistsAtPath:path]) {
            NSLog(@"I see it");
            NSDictionary * fAtt = [fm attributesOfItemAtPath:path error:nil];
            for (NSString * key in fAtt) {
                NSLog(@"Attributes %@ IS %@", key, [fAtt objectForKey:key]);
            }
//            [fm moveItemAtPath:path toPath:@"/Users/mykhailobondarenko/Developer/objc/README.md" error:nil];
        } else {
            NSLog(@"I don't see it");
        }
    }
    return 0;
}

