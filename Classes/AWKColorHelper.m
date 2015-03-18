//
//  AWKColorHelper.m
//  AWKHelpers
//
//  Created by Rens Verhoeven on 27-10-14.
//  Copyright (c) 2014 Awkward. All rights reserved.
//

#import "AWKColorHelper.h"

@implementation UIColor (AWKColorHelper)

+ (UIColor *)colorWithColorString:(NSString *)colorString {
    if ([colorString rangeOfString:@"#"].location != NSNotFound) {
        colorString = [colorString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    }
    UIColor *color = nil;
    if ([colorString isEqualToString:@"red"])
        color = [UIColor redColor];
    if ([colorString isEqualToString:@"green"])
        color = [UIColor greenColor];
    if ([colorString isEqualToString:@"blue"])
        color = [UIColor blueColor];
    if ([colorString isEqualToString:@"yellow"])
        color = [UIColor yellowColor];
    if ([colorString isEqualToString:@"purple"])
        color = [UIColor purpleColor];
    if ([colorString isEqualToString:@"light_gray"])
        color = [UIColor lightGrayColor];
    if ([colorString isEqualToString:@"lightgray"])
            color = [UIColor lightGrayColor];
    if ([colorString isEqualToString:@"gray"])
        color = [UIColor grayColor];
    if ([colorString isEqualToString:@"dark_gray"])
        color = [UIColor darkGrayColor];
    if ([colorString isEqualToString:@"darkgray"])
        color = [UIColor darkGrayColor];
    if ([colorString isEqualToString:@"brown"])
        color = [UIColor brownColor];
    if ([colorString isEqualToString:@"cyan"])
        color = [UIColor cyanColor];
    if ([colorString isEqualToString:@"magenta"])
        color = [UIColor magentaColor];
    if ([colorString isEqualToString:@"orange"])
        color = [UIColor magentaColor];
    if ([colorString isEqualToString:@"clear"])
        color = [UIColor clearColor];
    if ([colorString isEqualToString:@"000"] || [colorString isEqualToString:@"000000"] || [colorString isEqualToString:@"black"])
        color = [UIColor blackColor];
    if ([colorString isEqualToString:@"fff"] || [colorString isEqualToString:@"ffffff"] || [colorString isEqualToString:@"white"])
        color = [UIColor whiteColor];
    
    if (!color) {
        color = [UIColor colorWithHexString:colorString];
    }
    
    return color;
}

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            return nil;
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

+ (CGFloat)colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

/* Orignal code by:
 //
 //  UIColor+HexColors.m
 //  KiwiHarness
 //
 //  Created by Tim on 07/09/2012.
 //  Copyright (c) 2012 Charismatic Megafauna Ltd. All rights reserved.
 //
 */

- (NSString *)hexString {
    return [self hexValue];
}

- (NSString *)hexValue {
    UIColor *color = self;
    
    if (!color) {
        return nil;
    }
    
    if (color == [UIColor whiteColor]) {
        // Special case, as white doesn't fall into the RGB color space
        return @"#ffffff";
    }
    
    CGFloat red;
    CGFloat blue;
    CGFloat green;
    CGFloat alpha;
    
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    int redDec = (int)(red * 255);
    int greenDec = (int)(green * 255);
    int blueDec = (int)(blue * 255);
    
    NSString *returnString = [NSString stringWithFormat:@"#%02x%02x%02x", (unsigned int)redDec, (unsigned int)greenDec, (unsigned int)blueDec];
    
    return returnString;
}

@end
