//
//  AWKFontHelper.h
//  Awkward Helpers
//
//  Created by Rens Verhoeven on 04-11-14.
//  Copyright (c) 2014 Awkward. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (AWKFontHelper)

/**
 Logs all the available fonts on the device and in the app bundle. Leave the name empty for all fonts. The returned names as post-script names usable in UIFont's fontWithName:
 
 @param name A font name to filter the response for the given name

 */
+ (void)logAvailableFontsWithName:(NSString *)name;

@end
