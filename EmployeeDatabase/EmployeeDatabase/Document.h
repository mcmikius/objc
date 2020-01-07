//
//  Document.h
//  EmployeeDatabase
//
//  Created by Mykhailo Bondarenko on 06.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Person.h"

@interface Document : NSDocument {
    NSMutableArray * employees;
}

-(void)setEmployees: (NSMutableArray *) empl;

-(void)insertObject:(Person*)person inEmployeesAtIndex:(NSInteger)index;
-(void)removeObjectFromEmployeesAtIndex:(NSInteger)index;

@end

