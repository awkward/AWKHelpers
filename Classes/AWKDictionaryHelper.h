//
//  AWKDictionaryHelper.h
//  Awkward Helpers
//
//  Created by Rens Verhoeven on 24-10-14.
//  Copyright (c) 2014 Awkward. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    AWKDictionaryValueTypeNotImportant,
    AWKDictionaryValueTypeArray,
    AWKDictionaryValueTypeString,
    AWKDictionaryValueTypeDictionary
} AWKDictionaryValueType;

@interface NSDictionary (AWKDictionaryHelper)

/**
 ests to see if the object is a valid object in the dictionary. Checks include: does the object exist, is the object not NSNULL and is the object not nil.
 
 @param key The key for the object in the dictionary.
 
 @return YES if the object is valid, NO if not all tests are passed.
 */
- (BOOL)isValidObjectForKey:(NSString *)key;

/**
 Tests to see if the object is a valid object in the dictionary. Test include: does the object exist, is the object not NSNULL and is the object not nil. This allso checks for the giving types
 
 @param key The key for the object in the dictionary.
 @param type The type that is expected to be the object to check for in the dictionary.
 
 @return YES if the object is valid, NO if not all tests are passed.
 */
- (BOOL)isValidObjectForKey:(NSString *)key ofType:(AWKDictionaryValueType)type;

/**
 ests to see if the object is a valid object in the dictionary. Tests include: does the object exist, is the object not NSNULL and is the object not nil.
 
 @param key The key for the object in the dictionary.
 
 @return YES if the object is valid, NO if not all tests are passed.
 */
- (BOOL)objectForKeyIsValid:(NSString *)key;

/**
 Tests to see if the object is a valid object in the dictionary. Tests include: does the object exist, is the object not NSNULL, is the object not nil and is the object member of the specified class.
 
 @param key The key for the object in the dictionary.
 @param class The class that is expected to be the object in the dictionary.
 
 @return YES if the object is valid, NO if not all tests are passed.
 */
- (BOOL)objectForKey:(NSString *)key isValidForClass:(Class)aClass;

/**
 Tests to see if the object is a valid NSArray or NSMutableArray in the dictionary. Tests include: does the object exist, is the object not NSNULL, is the object not nil and is the object member of the NSArray class.
 
 @param key The key for the object in the dictionary.
 
 @return YES if the object is valid, NO if not all tests are passed.
 */
- (BOOL)objectForKeyIsValidArray:(NSString *)key;

/**
 Tests to see if the object is a valid NSDictionary or NSMutableDictionary in the dictionary. Tests include: does the object exist, is the object not NSNULL, is the object not nil and is the object member of the NSDictionary class.
 
 @param key The key for the object in the dictionary.
 
 @return YES if the object is valid, NO if not all tests are passed.
 */
- (BOOL)objectForKeyIsValidDictionary:(NSString *)key;

/**
 Tests to see if the object is a valid NSString or NSMutableString in the dictionary. Tests include: does the object exist, is the object not NSNULL, is the object not nil and is the object member of the NSString class.
 
 @param key The key for the object in the dictionary.
 
 @return YES if the object is valid, NO if not all tests are passed.
 */
- (BOOL)objectForKeyIsValidString:(NSString *)key;

/**
 Checks if the dictionary contains any objects
 
 @return Returns YES if the dictionary is empty
 */
- (BOOL)isEmpty;

@end
