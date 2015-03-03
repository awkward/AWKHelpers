//
//  AWKStringHelper.m
//  Awkward Helpers
//
//  Created by Rens Verhoeven on 27-10-14.
//  Copyright (c) 2014 Awkward. All rights reserved.
//

#import "AWKStringHelper.h"
#import <CommonCrypto/CommonDigest.h>
#import "AWKDictionaryHelper.h"


@implementation NSString (AWKStringHelper)

/**
 Original code by:
 
 NSStringHelper.m
 CocoaHelpers
 
 Created by Shaun Harrison on 10/14/08.
 Copyright (c) 2008-2009 enormego

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
 */

#pragma mark Hashing methods

- (NSString*)MD5String {
    const char* string = [self UTF8String];
    unsigned char result[16];
    CC_MD5(string, (CC_LONG)strlen(string), result);
    NSString* hash = [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                      result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
                      result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]];
    
    return [hash lowercaseString];
}

#pragma mark Checking methods

- (BOOL)containsString:(NSString*)string {
    return [self containsString:string options:NSCaseInsensitiveSearch];
}

- (BOOL)containsString:(NSString*)string options:(NSStringCompareOptions)options {
    return [self rangeOfString:string options:options].location == NSNotFound ? NO : YES;
}

#pragma mark Truncation methods

- (NSString*)stringByTruncatingToLength:(NSUInteger)length {
    return [self stringByTruncatingToLength:length direction:NSTruncateStringPositionEnd];
}

- (NSString*)stringByTruncatingToLength:(NSUInteger)length direction:(NSTruncateStringPosition)truncateFrom {
    return [self stringByTruncatingToLength:length direction:truncateFrom withEllipsisString:@"…"];
}

- (NSString*)stringByTruncatingToLength:(NSUInteger)length direction:(NSTruncateStringPosition)truncateFrom withEllipsisString:(NSString*)ellipsis {
    NSMutableString *result = [[NSMutableString alloc] initWithString:self];
    NSString *immutableResult;
    
    if([result length] <= length) {
        return self;
    }
    
    NSUInteger charactersEachSide = length / 2;
    
    NSString* first;
    NSString* last;
    
    switch(truncateFrom) {
        case NSTruncateStringPositionStart:
            [result insertString:ellipsis atIndex:[result length] - length + [ellipsis length] ];
            immutableResult  = [[result substringFromIndex:[result length] - length] copy];
            return immutableResult;
        case NSTruncateStringPositionMiddle:
            first = [result substringToIndex:charactersEachSide - [ellipsis length]+1];
            last = [result substringFromIndex:[result length] - charactersEachSide];
            immutableResult = [[[NSArray arrayWithObjects:first, last, NULL] componentsJoinedByString:ellipsis] copy];
            return immutableResult;
        default:
        case NSTruncateStringPositionEnd:
            [result insertString:ellipsis atIndex:length - [ellipsis length]];
            immutableResult  = [[result substringToIndex:length] copy];
            return immutableResult;
    }
}

#pragma mark Trimming methods

- (NSString*)stringByTrimmingLeadingWhitespace {
    NSInteger i = 0;
    
    while ((i < [self length])
           && [[NSCharacterSet whitespaceCharacterSet] characterIsMember:[self characterAtIndex:i]]) {
        i++;
    }
    return [self substringFromIndex:i];
}

- (NSString*)stringByTrimmingTrailingNewLine {
    return [self stringByTrimmingTrailingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
}

- (NSString *)stringByTrimmingTrailingCharactersInSet:(NSCharacterSet *)characterSet {
    NSUInteger location = 0;
    NSUInteger length = [self length];
    unichar charBuffer[length];
    [self getCharacters:charBuffer];
    
    for (length = [self length]; length > 0; length--) {
        if (![characterSet characterIsMember:charBuffer[length - 1]]) {
            break;
        }
    }
    
    return [self substringWithRange:NSMakeRange(location, length - location)];
}

#pragma mark URL Methods

- (NSString *)URLEncodedString {
    NSString *string = [NSString stringWithFormat:@"%@", self];
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[string UTF8String];
    NSInteger sourceLen = strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' || thisChar == ':' || thisChar == ';' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}

#pragma mark Attributed Methods

- (NSAttributedString *)attributedStringWithLineHeight:(CGFloat)lineHeight {
    return [self attributedStringWithLineHeight:lineHeight textAlignement:NSTextAlignmentLeft];
    
}

- (NSAttributedString *)attributedStringWithLineHeight:(CGFloat)lineHeight textAlignement:(NSTextAlignment)textAlignment {
    return [self attributedStringWithLineHeight:lineHeight textAlignement:textAlignment font:nil];
    
}

- (NSAttributedString *)attributedStringWithLineHeight:(CGFloat)lineHeight textAlignement:(NSTextAlignment)textAlignment font:(UIFont *)font {
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    [attributes setObjectIfNonNil:font forKey:NSFontAttributeName];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [paragraphStyle setMinimumLineHeight:lineHeight];
    [paragraphStyle setMaximumLineHeight:lineHeight];
    [paragraphStyle setAlignment:textAlignment];
    [attributes setObjectIfNonNil:paragraphStyle forKey:NSParagraphStyleAttributeName];
    return [[NSAttributedString alloc] initWithString:self attributes:attributes];
    
}
@end
