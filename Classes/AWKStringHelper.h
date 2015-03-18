//
//  AWKStringHelper.h
//  AWKHelpers
//
//  Created by Rens Verhoeven on 27-10-14.
//  Copyright (c) 2014 Awkward. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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

#pragma mark Attributed Methods

/**
 Creates a NSAttributedString from the string with the given line height
 
 @param lineHeight The lineheight to assign to the whole string
 
 @return Returns a NSAttributedString with the paragraphstyle and the required line height
 */
- (NSAttributedString *)attributedStringWithLineHeight:(CGFloat)lineHeight;

/**
 Creates a NSAttributedString from the string with the given line height and alignment
 
 @param lineHeight The lineheight to assign to the whole string
 @param textAlignment The alignment to assign to the whole string
 @param font The font to assign to the whole string
 
 @return Returns a NSAttributedString with the paragraphstyle and the required line height and alignment
 */
- (NSAttributedString *)attributedStringWithLineHeight:(CGFloat)lineHeight textAlignement:(NSTextAlignment)textAlignment;

/**
 Creates a NSAttributedString from the string with the given line height, alignment and font
 
 @param lineHeight The lineheight to assign to the whole string
 @param textAlignment The alignment to assign to the whole string
 
 @return Returns a NSAttributedString with the paragraphstyle and the required line height, text alignment and font
 */
- (NSAttributedString *)attributedStringWithLineHeight:(CGFloat)lineHeight textAlignement:(NSTextAlignment)textAlignment font:(UIFont *)font;

@end
