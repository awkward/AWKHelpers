//
//  AWKArrayHelper.h
//  AWKHelpers
//
//  Created by Rens Verhoeven on 24-10-14.
//  Copyright (c) 2014 Awkward. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, AWKArrayMappingOptions) {
    AWKArrayMapNilToNull = 1<<0,
    AWKArrayMapNilToDeletion = 1<<1
};

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

/**
 Creates a new array with new objects mapped to the values of the receicer array. The new values should be defined by the parameter block.
 
 @param mapBlock A block to return the destination values for the receiver array values. By default if you return nil, the new object will be copied from the receiver, unless you use a mapping option.
 @param options Mapping options
 
 @return A newly created array with modified values based on the receiver array.
 */
- (NSArray *)arrayByMappingObjectsWithBlock:(id (^)(id obj, NSUInteger idx))mapBlock options:(AWKArrayMappingOptions)options;

@end

@interface  NSMutableArray (AWKArrayHelper)

/**
 Reverse order of the NSMutableArray
 */
- (void)reverse;

/**
 Replaces all objects of the array with other objects, returned by the given mapping block.
 
 @param mapBlock A block to return the new object to replace the old object in the array. By default, returning nil will result in an unchanged object, unless you use a mapping option.
 @param options Mapping options
 
 */
- (void)replaceObjectsWithBlock:(id (^)(id obj, NSUInteger idx))mapBlock options:(AWKArrayMappingOptions)options;

@end