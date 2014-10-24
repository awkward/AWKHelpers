//
//  AWKArrayHelper.h
//  Awkward Helpers
//
//  Created by Rens Verhoeven on 24-10-14.
//  Copyright (c) 2014 Awkward. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (AWKArrayHelper)

/**
 Sorts the contents of the array reversed and returns a new NSArray with the reversed content
 
 @return The reversed content in an NSArray
 */
- (NSArray *)reversedArray;

/**
 Checks if the array contains any objects
 
 @return Returns YES if the array is empty
 */
- (BOOL)isEmpty;

/**
 Checks if an object exists at the given index
 
 @param index The index of the object to check for
 
 @return Returns YES if the array is empty
 */
- (BOOL)hasObjectAtIndex:(NSUInteger)index;

@end

@interface  NSMutableArray (AWKArrayHelper)

/**
 Reverse order of the NSMutableArray
 */
- (void)reverse;

@end