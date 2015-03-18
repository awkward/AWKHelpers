//
//  AWKHelpersDictionaryTests.m
//  AWKHelpers
//
//  Created by Rens Verhoeven on 18-03-15.
//  Copyright (c) 2015 Awkward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AWKHelpers.h"

@interface AWKHelpersDictionaryTests : XCTestCase

@property (nonatomic,strong) NSDictionary *dictionary;

@end

@implementation AWKHelpersDictionaryTests

- (void)setUp {
    [super setUp];
    self.dictionary  = @{
                         @"AWKInvalidObjectKey":[NSNull null],
                         @"AWKValidObjectKey":[NSArray new],
                         @"AWKInvalidArrayKey":[NSDictionary new],
                         @"AWKValidArrayKey":[NSArray new],
                         @"AWKInvalidDictionaryKey":[NSArray new],
                         @"AWKValidDictionaryKey":[NSDictionary new],
                         @"AWKInvalidStringKey":[NSArray new],
                         @"AWKValidStringKey":[NSString new],
                         @"AWKInvalidNumberKey":[NSArray new],
                         @"AWKValidNumberKey":[NSNumber numberWithInteger:2]
                         };
}

- (void)tearDown {
    self.dictionary = nil;
    [super tearDown];
}

#pragma mark Test Valid Object For Key

//Test if the object for the key is indeed valid
- (void)testDictionaryHelperValidObject {
    if (![self.dictionary isValidObjectForKey:@"AWKValidObjectKey"]) {
        XCTAssert(NO, @"'AWKValidObjectKey' returns as not a valid object");
    }
}

//Test if the object for the key is indeed invalid
- (void)testDictionaryHelperInvalidObject {
    if ([self.dictionary isValidObjectForKey:@"AWKInvalidObjectKey"]) {
        XCTAssert(NO, @"'AWKInvalidObjectKey' returns as a valid object");
    }
}

//Test if the object for the key exists in the dictionary
- (void)testDictionaryHelperNonExistingObject {
    if ([self.dictionary isValidObjectForKey:@"AWKNonExistingKey"]) {
        XCTAssert(NO, @"'AWKNonExistingKey' returns as a valid object");
    }
}

#pragma mark Test Valid Array Object For Key

//Test if the object for the key is a valid array type
- (void)testDictionaryHelperValidArrayType {
    if (![self.dictionary isValidObjectForKey:@"AWKValidArrayKey" ofType:AWKDictionaryValueTypeArray]) {
        XCTAssert(NO, @"'AWKValidArrayKey' returns as not a valid Array");
    }
}

//Test if the object for the key is a invalid array type
-(void)testDictionaryHelperInvalidArrayType {
    if ([self.dictionary isValidObjectForKey:@"AWKInvalidArrayKey" ofType:AWKDictionaryValueTypeArray]) {
        XCTAssert(NO, @"'AWKInvalidArrayKey' returns as a valid Array");
    }
}

#pragma mark Test Valid Dictionary Object For Key

//Test if the object for the key is a valid dictionary type
- (void)testDictionaryHelperValidDictionaryType {
    if (![self.dictionary isValidObjectForKey:@"AWKValidDictionaryKey" ofType:AWKDictionaryValueTypeDictionary]) {
        XCTAssert(NO, @"'AWKValidDictionaryKey' returns as not a valid Dictionary");
    }
}

//Test if the object for the key is a invalid dictionary type
-(void)testDictionaryHelperInvalidDictionaryType {
    if ([self.dictionary isValidObjectForKey:@"AWKInvalidDictionaryKey" ofType:AWKDictionaryValueTypeDictionary]) {
        XCTAssert(NO, @"'AWKInvalidDictionaryKey' returns as a valid Dictionary");
    }
}

#pragma mark Test Valid String Object For Key

//Test if the object for the key is a valid string type
- (void)testDictionaryHelperValidStringType {
    if (![self.dictionary isValidObjectForKey:@"AWKValidStringKey" ofType:AWKDictionaryValueTypeString]) {
        XCTAssert(NO, @"'AWKValidStringKey' returns as not a valid String");
    }
}

//Test if the object for the key is a invalid string type
-(void)testDictionaryHelperInvalidStringType {
    if ([self.dictionary isValidObjectForKey:@"AWKInvalidStringKey" ofType:AWKDictionaryValueTypeString]) {
        XCTAssert(NO, @"'AWKInvalidStringKey' returns as a valid String");
    }
}

//Test the performance of checking if the object for the key is a valid string type
- (void)testDictionaryHelperValidStringTypePerformance {
    [self measureBlock:^{
        BOOL result = [self.dictionary isValidObjectForKey:@"AWKValidStringKey" ofType:AWKDictionaryValueTypeString];
        if (!result) {
            XCTAssert(NO, @"'AWKValidStringKey' returns as not a valid String");
        }
    }];
    
}

//Test the performance of checking if the object for the key is a invalid string type
-(void)testDictionaryHelperInvalidStringTypePerformance {
    [self measureBlock:^{
        BOOL result = [self.dictionary isValidObjectForKey:@"AWKInvalidStringKey" ofType:AWKDictionaryValueTypeString];
        if (result) {
            XCTAssert(NO, @"'AWKValidStringKey' returns as not a valid String");
        }
    }];
}

#pragma mark Test Valid Number Object For Key

//Test if the object for the key is a valid number type
- (void)testDictionaryHelperValidNumberType {
    if (![self.dictionary isValidObjectForKey:@"AWKValidNumberKey" ofType:AWKDictionaryValueTypeNumber]) {
        XCTAssert(NO, @"'AWKValidNumberKey' returns as not a valid number");
    }
}

//Test if the object for the key is a invalid number type
-(void)testDictionaryHelperInvalidNumberType {
    if ([self.dictionary isValidObjectForKey:@"AWKInvalidNumberKey" ofType:AWKDictionaryValueTypeNumber]) {
        XCTAssert(NO, @"'AWKInvalidNumberKey' returns as a valid number");
    }
}

//Test the performance of checking if the object for the key is a valid number type
- (void)testDictionaryHelperValidNumberTypePerformance {
    [self measureBlock:^{
        BOOL result = [self.dictionary isValidObjectForKey:@"AWKValidNumberKey" ofType:AWKDictionaryValueTypeNumber];
        if (!result) {
            XCTAssert(NO, @"'AWKValidNumberKey' returns as not a valid number");
        }
    }];
    
}

//Test the performance of checking if the object for the key is a invalid number type
-(void)testDictionaryHelperInvalidNumberTypePerformance {
    [self measureBlock:^{
        BOOL result = [self.dictionary isValidObjectForKey:@"AWKInvalidNumberKey" ofType:AWKDictionaryValueTypeNumber];
        if (result) {
            XCTAssert(NO, @"'AWKInvalidNumberKey' returns as not a valid number");
        }
    }];
}

#pragma mark Test NSMutableDictionary Insert

//Test to see if the NSMutableDictionary doesn't add a nil object to the dictionary and doesn't crash
-(void)testDictionaryHelperInsertInvalidObject {
    NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionary];
    id object = nil;
    [mutableDictionary setObjectIfNonNil:object forKey:@"AWKNilObjectKey"];
    if ([mutableDictionary objectForKey:@"AWKNilObjectKey"]) {
        XCTAssert(NO,@"Failed and inserted non valid object");
    }
}

//Test to see if the NSMutableDictionary does at valid objects to the dictionary without crashing
-(void)testDictionaryHelperInsertValidObject {
    NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionary];
    id object = [NSString new];
    [mutableDictionary setObjectIfNonNil:object forKey:@"AWKObjectKey"];
    if (![mutableDictionary objectForKey:@"AWKObjectKey"]) {
        XCTAssert(NO,@"Failed to insert valid object");
    }
}

@end
