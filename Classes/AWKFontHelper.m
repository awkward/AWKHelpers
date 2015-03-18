//
//  AWKFontHelper.m
//  AWKHelpers
//
//  Created by Rens Verhoeven on 04-11-14.
//  Copyright (c) 2014 Awkward. All rights reserved.
//

#import "AWKFontHelper.h"

@implementation UIFont (AWKFontHelper)

+ (void)logAvailableFontsWithName:(NSString *)name {
    NSArray *familyNames = [UIFont familyNames];
    NSString *nameString = name;
    BOOL logged = NO;
    
    for (NSString *familyName in familyNames) {
        NSArray *fonts = [UIFont fontNamesForFamilyName:familyName];
        if ([nameString length] != 0 && [fonts firstObject]) {
            NSString *firstFont = [fonts firstObject];
            if ([firstFont.lowercaseString rangeOfString:[nameString lowercaseString]].location != NSNotFound) {
                NSLog(@"Fonts for family \"%@\": %@",familyName,fonts);
                logged = YES;
            }
        }
        if ([nameString length] == 0) {
            NSLog(@"Fonts for family \"%@\": %@",familyName,fonts);
            logged = YES;
        }
        
    }
    
    if (!logged) {
        if ([nameString length] != 0) {
            NSLog(@"No fonts available containig \"%@\"!",nameString);
        } else {
            NSLog(@"No fonts available!");
        }
    }
}

@end
