//
//  AWKHelpersTests.m
//  AWKHelpersTests
//
//  Created by Rens Verhoeven on 18-03-15.
//  Copyright (c) 2015 Awkward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AWKHelpers.h"

@interface AWKHelpersTests : XCTestCase

@property (nonatomic,strong) NSDictionary *dictionary;

@end

@implementation AWKHelpersTests

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
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark Dictionary Helper Test General

- (void)testDictionaryHelperValidObject {
    if (![self.dictionary isValidObjectForKey:@"AWKValidObjectKey"]) {
        XCTAssert(NO, @"'AWKValidObjectKey' returns as not a valid object");
    }
}

- (void)testDictionaryHelperInvalidObject {
    if ([self.dictionary isValidObjectForKey:@"AWKInvalidObjectKey"]) {
        XCTAssert(NO, @"'AWKInvalidObjectKey' returns as a valid object");
    }
}

- (void)testDictionaryHelperNonExistingObject {
    if ([self.dictionary isValidObjectForKey:@"AWKNonExistingKey"]) {
        XCTAssert(NO, @"'AWKNonExistingKey' returns as a valid object");
    }
}

#pragma mark Dictionary Helper Test Array

- (void)testDictionaryHelperValidArrayType {
    if (![self.dictionary isValidObjectForKey:@"AWKValidArrayKey" ofType:AWKDictionaryValueTypeArray]) {
        XCTAssert(NO, @"'AWKValidArrayKey' returns as not a valid Array");
    }
}

-(void)testDictionaryHelperInvalidArrayType {
    if ([self.dictionary isValidObjectForKey:@"AWKInvalidArrayKey" ofType:AWKDictionaryValueTypeArray]) {
        XCTAssert(NO, @"'AWKInvalidArrayKey' returns as a valid Array");
    }
}

#pragma mark Dictionary Helper Test Dictionary
- (void)testDictionaryHelperValidDictionaryType {
    if (![self.dictionary isValidObjectForKey:@"AWKValidDictionaryKey" ofType:AWKDictionaryValueTypeDictionary]) {
        XCTAssert(NO, @"'AWKValidDictionaryKey' returns as not a valid Dictionary");
    }
}

-(void)testDictionaryHelperInvalidDictionaryType {
    if ([self.dictionary isValidObjectForKey:@"AWKInvalidDictionaryKey" ofType:AWKDictionaryValueTypeDictionary]) {
        XCTAssert(NO, @"'AWKInvalidDictionaryKey' returns as a valid Dictionary");
    }
}

#pragma mark Dictionary Helper Test String

- (void)testDictionaryHelperValidStringType {
    if (![self.dictionary isValidObjectForKey:@"AWKValidStringKey" ofType:AWKDictionaryValueTypeString]) {
        XCTAssert(NO, @"'AWKValidStringKey' returns as not a valid String");
    }
}

-(void)testDictionaryHelperInvalidStringType {
    if ([self.dictionary isValidObjectForKey:@"AWKInvalidStringKey" ofType:AWKDictionaryValueTypeString]) {
        XCTAssert(NO, @"'AWKInvalidStringKey' returns as a valid String");
    }
}

- (void)testDictionaryHelperValidStringTypePerformance {
    [self measureBlock:^{
        BOOL result = [self.dictionary isValidObjectForKey:@"AWKValidStringKey" ofType:AWKDictionaryValueTypeString];
        if (!result) {
            XCTAssert(NO, @"'AWKValidStringKey' returns as not a valid String");
        }
    }];
    
}

-(void)testDictionaryHelperInvalidStringTypePerformance {
    [self measureBlock:^{
        BOOL result = [self.dictionary isValidObjectForKey:@"AWKInvalidStringKey" ofType:AWKDictionaryValueTypeString];
        if (result) {
            XCTAssert(NO, @"'AWKValidStringKey' returns as not a valid String");
        }
    }];
}

#pragma mark Dictionary Helper Test Number

- (void)testDictionaryHelperValidNumberType {
    if (![self.dictionary isValidObjectForKey:@"AWKValidNumberKey" ofType:AWKDictionaryValueTypeNumber]) {
        XCTAssert(NO, @"'AWKValidNumberKey' returns as not a valid number");
    }
}

-(void)testDictionaryHelperInvalidNumberType {
    if ([self.dictionary isValidObjectForKey:@"AWKInvalidNumberKey" ofType:AWKDictionaryValueTypeNumber]) {
        XCTAssert(NO, @"'AWKInvalidNumberKey' returns as a valid number");
    }
}

- (void)testDictionaryHelperValidNumberTypePerformance {
    [self measureBlock:^{
        BOOL result = [self.dictionary isValidObjectForKey:@"AWKValidNumberKey" ofType:AWKDictionaryValueTypeNumber];
        if (!result) {
            XCTAssert(NO, @"'AWKValidNumberKey' returns as not a valid number");
        }
    }];
    
}

-(void)testDictionaryHelperInvalidNumberTypePerformance {
    [self measureBlock:^{
        BOOL result = [self.dictionary isValidObjectForKey:@"AWKInvalidNumberKey" ofType:AWKDictionaryValueTypeNumber];
        if (result) {
            XCTAssert(NO, @"'AWKInvalidNumberKey' returns as not a valid number");
        }
    }];
}

#pragma mark Dictionary Helper Insert Test

-(void)testDictionaryHelperInsertInvalidObject {
    NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionary];
    id object = nil;
    [mutableDictionary setObjectIfNonNil:object forKey:@"AWKNilObjectKey"];
    if ([mutableDictionary objectForKey:@"AWKNilObjectKey"]) {
        XCTAssert(NO,@"Failed and inserted non valid object");
    }
}

-(void)testDictionaryHelperInsertValidObject {
    NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionary];
    id object = [NSString new];
    [mutableDictionary setObjectIfNonNil:object forKey:@"AWKObjectKey"];
    if (![mutableDictionary objectForKey:@"AWKObjectKey"]) {
        XCTAssert(NO,@"Failed to insert valid object");
    }
}

@end
