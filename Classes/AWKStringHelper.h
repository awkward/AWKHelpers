//
//  AWKStringHelper.h
//  Awkward Helpers
//
//  Created by Rens Verhoeven on 27-10-14.
//  Copyright (c) 2014 Awkward. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    NSTruncateStringPositionStart=0,
    NSTruncateStringPositionMiddle,
    NSTruncateStringPositionEnd
}; typedef int NSTruncateStringPosition;

@interface NSString (AWKStringHelper)

#pragma mark Hashing methods

/**
 Transforms the current string into a MD5 Hash using CommonCrypto
 
 @return Returns the MD5 hash in a NSString
 */
- (NSString *)MD5String;

#pragma mark Checking methods

/**
 Checks if the given string (needle) is found in the current string
 
 @param string The string to look for in the current string
 
 @return Returns YES if the given string is found
 */
- (BOOL)containsString:(NSString *)string;

/**
 Checks if the given string (needle) is found in the current string
 
 @param string The string to look for in the current string
 @param options A set of NSStringCompareOptions to use while searching the current string
 
 @return Returns YES if the given string is found
 */
- (BOOL)containsString:(NSString *)string options:(NSStringCompareOptions)options;

#pragma mark Truncation methods

/**
 Truncates the current string to the given length with the HORIZONTAL ELLIPSIS symbol at the end
 
 @param length The length to truncate the string to
 
 @return Returns a new (truncated) string
 */
- (NSString *)stringByTruncatingToLength:(NSUInteger)length;

/**
 Truncates the current string to the given length with the "HORIZONTAL ELLIPSIS" symbol at the end
 
 @param length The length to truncate the string to
 @param truncateFrom The position to put the truncation, start, middle or end
 
 @return Returns a new (truncated) string
 */
- (NSString *)stringByTruncatingToLength:(NSUInteger)length direction:(NSTruncateStringPosition)truncateFrom;

/**
 Truncates the current string to the given length with the given ellipsis at the end
 
 @param length The length to truncate the string to
 @param truncateFrom The position to put the truncation, start, middle or end
 @param ellipsis The string to put at the truncation point
 
 @return Returns a new (truncated) string
 */
- (NSString *)stringByTruncatingToLength:(NSUInteger)length direction:(NSTruncateStringPosition)truncateFrom withEllipsisString:(NSString *)ellipsis;

#pragma mark Trimming methods

/**
 Removes all the beginning white spaces such as spaces, new lines and tabs of the current string
 
 @return Returns a new (trimmed) string
 */
- (NSString *)stringByTrimmingLeadingWhitespace;

/**
 Removes all the ending new lines of the current string
 
 @return Returns a new (trimmed) string
 */
- (NSString *)stringByTrimmingTrailingNewLine;

/**
 Removes all the ending characters in the given set of the current string
 
 @param characterSet The set of characters to trim from the string
 
 @return Returns a new (trimmed) string
 */
- (NSString *)stringByTrimmingTrailingCharactersInSet:(NSCharacterSet *)characterSet;

#pragma mark URL Methods

/**
 Creates a URL safe version of the current string
 
 @return Returns a UTF-8 encoded string representation of current string
 */
- (NSString *)URLEncodedString;
@end
