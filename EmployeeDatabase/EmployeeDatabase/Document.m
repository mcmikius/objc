//
//  Document.m
//  EmployeeDatabase
//
//  Created by Mykhailo Bondarenko on 06.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import "Document.h"
#import "PreferencesController.h"

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
        for (Person * person in employees) {
            [self stopObservingPerson:person];
        }
        employees = empl;
        for (Person *person in employees) {
            [self startObservingPerson:person];
        }
    }
}

- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)windowController {
    [super windowControllerDidLoadNib:windowController];
    [tableView setBackgroundColor:[PreferencesController preferenceTableBgColor]];
}


- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    [[tableView window] endEditingFor:nil];
    return [NSKeyedArchiver archivedDataWithRootObject:employees];
}


- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    NSMutableArray *newArray = nil;
    @try {
        newArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    @catch (NSException *e){
        if (outError) {
            NSDictionary *d = [NSDictionary dictionaryWithObject:@"The file is invalid" forKey:NSLocalizedFailureReasonErrorKey];
            *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:d];
            return NO;
        }
    }
    [self setEmployees:newArray];
    return YES;
}

- (void)insertObject:(Person *)person inEmployeesAtIndex:(NSInteger)index {
    NSUndoManager *undo = [self undoManager];
    [[undo prepareWithInvocationTarget:self]removeObjectFromEmployeesAtIndex:index];
    if (![undo isUndoing]) {
        [undo setActionName:@"Add person"];
    }
    [self startObservingPerson:person];
    [employees insertObject:person atIndex:index];
}

- (void)removeObjectFromEmployeesAtIndex:(NSInteger)index {
    NSUndoManager *undo = [self undoManager];
    Person * person = [employees objectAtIndex:index];
    [[undo prepareWithInvocationTarget:self]insertObject:person inEmployeesAtIndex:index];
    if (![undo isUndoing]) {
        [undo setActionName:@"Remove person"];
    }
    [self stopObservingPerson:person];
    [employees removeObjectAtIndex:index];
}

- (void)changeKeyPath: (NSString*)keyPath ofObject:(id)obj toValue:(id)newValue {
    [obj setValue: newValue forKeyPath: keyPath];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context != &RMDocumentKVOContext) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    NSUndoManager *undo = [self undoManager];
    id oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    if (oldValue == [NSNull null]) {
        oldValue = nil;
    }
    
    [[undo prepareWithInvocationTarget:self] changeKeyPath:keyPath ofObject:object toValue:oldValue];
    
    [undo setActionName:@"Edit"];
    
}

@end
