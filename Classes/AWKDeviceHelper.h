//
//  AWKDeviceHelper.h
//  AWKHelpers
//
//  Created by Rens Verhoeven on 24-10-14.
//  Copyright (c) 2014 Awkward. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (AWKDeviceHelper)

/**
 Checks if the current UIDevice has a retina display
 
 @return Returns YES if the current device has a retina display.
 */
- (BOOL)hasRetinaScreen;

/**
 Checks if the current UIDevice has a retinaHD display
 
 @return Returns YES if the current device has a retinaHD display.
 */
- (BOOL)hasRetinaHDScreen;

/**
 Returns the device model of the current UIDevice
 
 @return Returns a string of the current device model
 */
- (NSString *)deviceModel;

/**
 Checks if the current UIDevice has a 3,5 inch screen
 
 @return Returns YES if the device has a 3,5 inch screen
 */
- (BOOL)has35InchScreen;

/**
 Checks if the current UIDevice has a 4 inch screen
 
 @return Returns YES if the device has a 3,5 inch screen
 */
- (BOOL)has4InchScreen;

/**
 Checks if the systemVersion is newer than the Current UIDevice's systemVersion
 
 @return Returns YES if the device systemVersion is newer, if not it's NO
 */
- (BOOL)systemVersionIsNewerThan:(NSString *)systemVersion;

/**
 Checks if the systemVersion is newer than the Current UIDevice's systemVersion.
 Use this if you are targeting features in major releases (7.0, 7.1 ,8.0, 8.1)
 
 @return Returns YES if the device systemVersion is newer, if not it's NO
 */
- (BOOL)majorSystemVersionIsNewerThan:(NSString *)systemVersion;

/**
 Checks if the systemVersion is newer than the Current UIDevice's systemVersion.
 Use this if you are targeting features in minor releases (7.0.1, 7.0.2 ,8.0.2, 8.1.1)
 
 @return Returns YES if the device systemVersion is newer, if not it's NO
 */
- (BOOL)minorSystemVersionIsNewerThan:(NSString *)systemVersion;

/**
 Checks if the Current UIDevice's systemVersion is iOS 4 or newer than iOS 4.
 
 @return Returns YES if the device systemVersion is newer, if not it's NO
 */
- (BOOL)hasiOS4OrNewer;

/**
 Checks if the Current UIDevice's systemVersion is iOS 5 or newer than iOS 5.
 
 @return Returns YES if the device systemVersion is newer, if not it's NO
 */
- (BOOL)hasiOS5OrNewer;

/**
 Checks if the Current UIDevice's systemVersion is iOS 6 or newer than iOS 6.
 
 @return Returns YES if the device systemVersion is newer, if not it's NO
 */
- (BOOL)hasiOS6OrNewer;

/**
 Checks if the Current UIDevice's systemVersion is iOS 7 or newer than iOS 7.
 
 @return Returns YES if the device systemVersion is newer, if not it's NO
 */
- (BOOL)hasiOS7OrNewer;

/**
 Checks if the Current UIDevice's systemVersion is iOS 8 or newer than iOS 8.
 
 @return Returns YES if the device systemVersion is newer, if not it's NO
 */
- (BOOL)hasiOS8OrNewer;

/**
 Checks if the Current UIDevice's systemVersion is iOS 9 or newer than iOS 9.
 
 @return Returns YES if the device systemVersion is newer, if not it's NO
 */
- (BOOL)hasiOS9OrNewer;

/**
 Checks if the Current UIDevice's systemVersion is iOS 10 or newer than iOS 10.
 
 @return Returns YES if the device systemVersion is newer, if not it's NO
 */
- (BOOL)hasiOS10OrNewer;

@end
