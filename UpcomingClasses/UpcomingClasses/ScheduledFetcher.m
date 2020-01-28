//
//  ScheduledFetcher.m
//  UpcomingClasses
//
//  Created by Mykhailo Bondarenko on 28.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import "ScheduledFetcher.h"
#import "ScheduledClass.h"

@implementation ScheduledFetcher
- (id)init {
    if (self = [super init]) {
        classes = [[NSMutableArray alloc]init];
        dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzzz"];
        
    }
    return self;
}
- (NSArray *)fetchClassesWithError:(NSError *__autoreleasing  _Nullable *)outError {
    NSURL *xmlURL = [NSURL URLWithString:@"http://bignerdranch.com/xml/schedule"];
    NSURLRequest *req = [NSURLRequest requestWithURL:xmlURL cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30];
    NSURLResponse *resp = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:&resp error:outError];
    if (!data) return nil;
    NSLog(@"Recieved %ld bytes", [data length]);
    return nil;
    
}
@end
