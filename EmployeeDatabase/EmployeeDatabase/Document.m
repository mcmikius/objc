//
//  Document.m
//  EmployeeDatabase
//
//  Created by Mykhailo Bondarenko on 06.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import "Document.h"

@interface Document ()

@end

static void *RMDocumentKVOContext;

@implementation Document

- (void)startObservingPerson:(Person *)person {
    
    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld context:RMDocumentKVOContext];
    
    [person addObserver:self forKeyPath:@"raise" options:NSKeyValueObservingOptionOld context:RMDocumentKVOContext];
}

- (void)stopObservingPerson:(Person *)person {
    [person removeObserver:self forKeyPath:@"name"];
    [person removeObserver:self forKeyPath:@"raise"];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        employees = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (void)setEmployees:(NSMutableArray *)empl {
    if (employees != empl) {
        employees = empl;
    }
}

- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}


- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error if you return nil.
    // Alternatively, you could remove this method and override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return nil;
}


- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error if you return NO.
    // Alternatively, you could remove this method and override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you do, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return YES;
}

- (void)insertObject:(Person *)person inEmployeesAtIndex:(NSInteger)index {
    NSUndoManager *undo = [self undoManager];
    [[undo prepareWithInvocationTarget:self]removeObjectFromEmployeesAtIndex:index];
    if (![undo isUndoing]) {
        [undo setActionName:@"Add person"];
    }
    [employees insertObject:person atIndex:index];
}

- (void)removeObjectFromEmployeesAtIndex:(NSInteger)index {
    NSUndoManager *undo = [self undoManager];
    Person * person = [employees objectAtIndex:index];
    [[undo prepareWithInvocationTarget:self]insertObject:person inEmployeesAtIndex:index];
    if (![undo isUndoing]) {
        [undo setActionName:@"Remove person"];
    }
    [employees removeObjectAtIndex:index];
}

@end
