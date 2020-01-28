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
    BOOL success;
    NSURL *xmlURL = [NSURL URLWithString:@"http://bignerdranch.com/xml/schedule"];
    NSURLRequest *req = [NSURLRequest requestWithURL:xmlURL cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30];
    NSURLResponse *resp = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:&resp error:outError];
    if (!data) return nil;
    NSLog(@"Recieved %ld bytes", [data length]);
    [classes removeAllObjects];
    NSXMLParser *parser;
    parser = [[NSXMLParser alloc]initWithData:data];
    [parser setDelegate:self];
    success = [parser parse];
    if (!success) {
        *outError = [parser parserError];
        return nil;
    }
    NSArray *outPut = [classes copy];
    return outPut;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    if ([elementName isEqual:@"class"]) {
        currentFields = [[NSMutableDictionary alloc]init];
        
    } else if ([elementName isEqual:@"offering"]) {
        [currentFields setObject:[attributeDict objectForKey:@"href"] forKey:@"href"];
    }
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqual:@"class"]) {
        ScheduledClass *currentClass = [[ScheduledClass alloc]init];
        [currentClass setName:[currentFields objectForKey:@"offering"]];
        [currentClass setLocation:[currentFields objectForKey:@"location"]];
        [currentClass setHref:[currentFields objectForKey:@"href"]];
        NSString *beginString = [currentFields objectForKey:@"begin"];
        NSDate *beginDate = [dateFormatter dateFromString:beginString];
        [currentClass setBegin: beginDate];
        [classes addObject:currentClass];
        currentClass = nil;
        currentFields = nil;
    } else if (currentFields && currentString) {
        NSString *trimmed;
        trimmed = [currentString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [currentFields setObject:trimmed forKey:elementName];
    }
    currentString = nil;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!currentString) {
        currentString = [[NSMutableString alloc]init];
        [currentString appendString:string];
    }
}

@end
