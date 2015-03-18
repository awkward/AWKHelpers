//
//  AWKDateHelper.m
//  AWKHelpers
//
//  Created by Rens Verhoeven on 04-11-14.
//  Copyright (c) 2014 Awkward. All rights reserved.
//

#import "AWKDateHelper.h"

@implementation NSDate (AWKDateHelper)

/**
 Warning: this helper is still in the development and might give the wrong return value. Don't use this for date critical applications but rather for viewing of dates.
 If you want to help improve this helper, please create a pull request: https://github.com/awkward/AWKHelpers
 */

- (BOOL)isToday {
    return [[NSDate date] isEqualToDateIgnoringTime:self];
}

- (BOOL)isYesterday {
    return [[NSDate tommorowDate] isEqualToDateIgnoringTime:self];
}

- (BOOL)isTommorow {
    return [[NSDate tommorowDate] isEqualToDateIgnoringTime:self];
}

- (BOOL)isEqualToDateIgnoringTime:(NSDate *)date {
    unsigned flags = (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfYear |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);
    NSCalendar *calender = [NSCalendar autoupdatingCurrentCalendar];
    
    NSDateComponents *components1 = [calender components:flags fromDate:self];
    NSDateComponents *components2 = [calender components:flags fromDate:date];
    return ((components1.year == components2.year) && (components1.month == components2.month) && (components1.day == components2.day));
}

- (BOOL)isPastDate {
    NSDate *now = [NSDate date];
    return ([[now earlierDate:self] isEqualToDate:self]);
}

- (BOOL)isFutureDate {
    NSDate *now = [NSDate date];
    return ([[now laterDate:self] isEqualToDate:self]);
}

- (NSDate *)midnightDate {
    return [[NSCalendar autoupdatingCurrentCalendar] dateFromComponents:[[NSCalendar currentCalendar] components:(NSCalendarUnitWeekOfYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self]];
}

+ (NSDate *)tommorowDate {
    return [[NSDate date] nextDate];
}

+ (NSDate *)yesterdayDate {
    return [[NSDate date] previousDate];
}

- (NSDate *)nextDate {
    return [self dateByAddingDays:1];
}

- (NSDate *)previousDate {
    return [self dateBySubtractingDays:1];
}

- (NSDate *)dateBySubtractingDays:(NSUInteger)days {
    return [self dateByAddingDays:(days * -1)];
}

- (NSDate *)dateByAddingDays:(NSUInteger)days {
    NSDate *date = self;
    NSCalendar *calender = [NSCalendar autoupdatingCurrentCalendar];
    
    // now build a NSDate object for the next day
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:days];
    NSDate *newDate = [calender dateByAddingComponents:offsetComponents toDate:[date midnightDate] options:kNilOptions];
    return newDate;
}

@end
