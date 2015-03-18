//
//  AWKArrayHelper.m
//  AWKHelpers
//
//  Created by Rens Verhoeven on 24-10-14.
//  Copyright (c) 2014 Awkward. All rights reserved.
//

#import "AWKArrayHelper.h"

@implementation NSArray (AWKArrayHelper)

- (NSArray *)reversedArray {
    if (self.count == 0) {
        return nil;
    }
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) {
        [array addObject:element];
    }
    return [NSArray arrayWithArray:array];
}

- (BOOL)isEmpty {
    return (self.count == 0);
}

- (BOOL)hasObjectAtIndex:(NSUInteger)index {
    if (index == NSNotFound) {
        return NO;
    }
    if ((NSInteger)index < 0) {
        return NO;
    }
    if (self.count == 0) {
        return NO;
    }
    if (index+1 > self.count) {
        return NO;
    }
    return YES;
}

- (NSArray *)arrayByMappingObjectsWithBlock:(id (^)(id obj, NSUInteger idx))mapBlock options:(AWKArrayMappingOptions)options {
    NSAssert(mapBlock!=nil, @"Map block should not be nil");
    NSMutableArray *mappedArray = [[NSMutableArray alloc] initWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id result = mapBlock(obj, idx);
        if (result) {
            [mappedArray addObject:result];
        } else if (options&AWKArrayMapNilToNull) {
            [mappedArray addObject:[NSNull null]];
        } else if ((options&AWKArrayMapNilToDeletion) == 0) {
            [mappedArray addObject:obj];
        }
    }];
    NSArray *resultArray = [mappedArray copy];
    return resultArray;
}

@end

@implementation NSMutableArray (AWKArrayHelper)

- (void)reverse {
    if (self.count == 0) {
        return;
    }
    NSUInteger i = 0;
    NSUInteger j = [self count] - 1;
    while (i < j) {
        [self exchangeObjectAtIndex:i
                  withObjectAtIndex:j];
        
        i++;
        j--;
    }
}

- (void)replaceObjectsWithBlock:(id (^)(id obj, NSUInteger idx))mapBlock options:(AWKArrayMappingOptions)options{
    NSAssert(mapBlock!=nil, @"Map block should not be nil");
    NSMutableIndexSet *deletedIndices = [[NSMutableIndexSet alloc] init];
    for (NSUInteger idx = 0; idx < self.count; idx++) {
        id oldObject = self[idx];
        id newObject = mapBlock(oldObject, idx);
        if (newObject) {
            [self replaceObjectAtIndex:idx withObject:newObject];
        } else if (options&AWKArrayMapNilToNull) {
            [self replaceObjectAtIndex:idx withObject:[NSNull null]];
        } else if (options&AWKArrayMapNilToDeletion) {
            [deletedIndices addIndex:idx];
        }
    }
    if (deletedIndices.count > 0) {
        [self removeObjectsAtIndexes:deletedIndices];
    }
}

@end
