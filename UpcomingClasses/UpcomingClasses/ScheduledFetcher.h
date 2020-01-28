//
//  ScheduledFetcher.h
//  UpcomingClasses
//
//  Created by Mykhailo Bondarenko on 28.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScheduledFetcher : NSObject <NSXMLParserDelegate> {
    NSMutableArray *classes;
    NSMutableString *currentString;
    NSMutableDictionary *currentFields;
    NSDateFormatter *dateFormatter;
}

- (NSArray*)fetchClassesWithError:(NSError**)outError;

@end

NS_ASSUME_NONNULL_END
