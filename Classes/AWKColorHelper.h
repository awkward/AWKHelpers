//
//  AWKColorHelper.h
//  Awkward Helpers
//
//  Created by Rens Verhoeven on 27-10-14.
//  Copyright (c) 2014 Awkward. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (AWKColorHelper)

/**
 Transforms the given string into a UIColor
 
 @param colorString A hex or default name string to turn into a color. Default colors are the colors supported by UIColor like green, red, blue, yellow, cyan etc.
 
 @return Returns the UIColor that is the closest color string, this could be nil if the name string is not a valid name
 */
+ (UIColor *)colorWithColorString:(NSString *)colorString;

/**
 Transforms the given string (hex) into a UIColor
 
 @param hexString The hex string in one of the following formats: #RGB, #ARGB, #RRGGBB, #AARRGGBB
 
 @return Returns the UIColor that is the closest to the hex string
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 Get the hex value of the given UIColor
 
 @return Returns the hex in the following format: #RRGGBB
 */
- (NSString *)hexString;

/**
 Get the hex value of the given UIColor
 
 @return Returns the hex in the following format: #RRGGBB
 */
- (NSString *)hexValue;

@end
