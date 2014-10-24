//
//  AWKArrayHelper.m
//  Awkward Helpers
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
    if (self.count == 0) {
        return NO;
    }
    if (index+1 > self.count) {
        return NO;
    }
    return YES;
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

@end
