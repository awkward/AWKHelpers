//
//  AWKDictionaryHelper.m
//  Awkward Helpers
//
//  Created by Rens Verhoeven on 24-10-14.
//  Copyright (c) 2014 Awkward. All rights reserved.
//

#import "AWKDictionaryHelper.h"

@implementation NSDictionary (AWKDictionaryHelper)

- (BOOL)isValidObjectForKey:(NSString *)key {
    return [self isValidObjectForKey:key ofType:AWKDictionaryValueTypeNotImportant];
}

- (BOOL)isValidObjectForKey:(NSString *)key ofType:(AWKDictionaryValueType)type {
    BOOL isValid = [self objectForKeyIsValid:key];
    if (type == AWKDictionaryValueTypeNotImportant || !isValid) {
        return isValid;
    } else {
        switch (type) {
            case AWKDictionaryValueTypeArray:
                return [self objectForKeyIsValidArray:key];
                break;
            case AWKDictionaryValueTypeDictionary:
                return [self objectForKeyIsValidDictionary:key];
                break;
            case AWKDictionaryValueTypeString:
                return [self objectForKeyIsValidString:key];
                break;
            default:
                return isValid;
                break;
        }
    }
}

- (BOOL)objectForKeyIsValid:(NSString *)key {
    if (![self objectForKey:key]) {
        return NO;
    } else if ([[self objectForKey:key] isKindOfClass:[NSNull class]]) {
        return NO;
    } else if ([self objectForKey:key] == nil) {
        return NO;
    } else {
        return YES;
    }
}

- (BOOL)objectForKeyIsValidArray:(NSString *)key {
    return [self objectForKey:key isValidForClass:[NSArray class]];
}

- (BOOL)objectForKeyIsValidDictionary:(NSString *)key {
    return [self objectForKey:key isValidForClass:[NSDictionary class]];
}

- (BOOL)objectForKeyIsValidString:(NSString *)key {
    return [self objectForKey:key isValidForClass:[NSString class]];
}

- (BOOL)objectForKey:(NSString *)key isValidForClass:(Class)aClass {
    if (![self objectForKeyIsValid:key]) {
        return NO;
    }
    id object = [self objectForKey:key];
    BOOL isValid = [object isKindOfClass:aClass];
    return isValid;
}

- (BOOL)isEmpty {
    return (self.count == 0);
}

@end
