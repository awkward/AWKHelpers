//
//  AWKApplicationHelper.h
//  AWKHelpers
//
//  Created by Rens Verhoeven on 04-11-14.
//  Copyright (c) 2014 Awkward. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (AWKApplicationHelper)

/**
 Returns the path to the documents directory of the application
 
 @return Returns the path to the documents directory of the application
 */
- (NSString *)documentsDirectory;

/**
 Returns the app version of the current app bundle
 
 @return Returns the CFBundleShortVersionString
 */
- (NSString *)appVersion;

/**
 Returns the build version of the current app bundle
 
 @return Returns the CFBundleVersion
 */
- (NSString *)buildVersion;

@end
