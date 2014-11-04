//
//  AWKDateHelper.h
//  Awkward Helpers
//
//  Created by Rens Verhoeven on 04-11-14.
//  Copyright (c) 2014 Awkward. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (AWKDateHelper)

/**
 Warning: this helper is still in the development and might give the wrong return value. Don't use this for date critical applications but rather for viewing of dates.
 If you want to help improve this helper, please create a pull request: https://github.com/awkward/AWKHelpers
 */

/**
 Checks if the current (self) date is today by ignoring the time
 
 @return Returns YES if the current date is today
 */
- (BOOL)isToday;

/**
 Checks if the current (self) date is yesterday by ignoring the time
 
 @return Returns YES if the current date is yesterday
 */
- (BOOL)isYesterday;

/**
 Checks if the current (self) date is tommorow by ignoring the time
 
 @return Returns YES if the current date is tommorow
 */
- (BOOL)isTommorow;

/**
 Checks if the current (self) date is a date in the past
 
 @return Returns YES if the current date is in the past
 */
- (BOOL)isPastDate;

/**
 Checks if the current (self) date is a date in the future
 
 @return Returns YES if the current date is in the future
 */
- (BOOL)isFutureDate;

/**
 Removes a number of days from the current (self) date
 
 @param days The number of days to remove from the current date
 
 @return Returns the current date minus the number of days
 */
- (NSDate *)dateBySubtractingDays:(NSUInteger)days;

/**
 Adds a number of days to the current (self) date
 
 @param days The number of days to add to the current date
 
 @return Returns the current date plus the number of days
 */
- (NSDate *)dateByAddingDays:(NSUInteger)days;


@end
