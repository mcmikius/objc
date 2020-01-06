//
//  Document.h
//  EmployeeDatabase
//
//  Created by Mykhailo Bondarenko on 06.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument {
    NSMutableArray * employees;
}

-(void)setEmployees: (NSMutableArray *) empl;

@end

