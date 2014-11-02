//
//  AWKDeviceHelper.m
//  Awkward Helpers
//
//  Created by Rens Verhoeven on 24-10-14.
//  Copyright (c) 2014 Awkward. All rights reserved.
//

#import "AWKDeviceHelper.h"
#import <sys/utsname.h>

@implementation UIDevice (AWKDeviceHelper)

-(BOOL)hasRetinaScreen {
    if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
        CGFloat scale = [[UIScreen mainScreen] scale];
        if (scale > 1.0) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}


-(BOOL)hasRetinaHDScreen {
    if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
        CGFloat scale = [[UIScreen mainScreen] scale];
        if (scale > 2.0) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

-(NSString *)deviceModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
}

-(BOOL)has35InchScreen {
    UIScreen *screen = [UIScreen mainScreen];
    CGSize size = screen.bounds.size;
    return (size.height == 480 && size.width == 320);
}

-(BOOL)has4InchScreen {
    UIScreen *screen = [UIScreen mainScreen];
    CGSize size = screen.bounds.size;
    return (size.height == 568 && size.width == 320);
}

-(BOOL)systemVersionIsNewerThan:(NSString *)systemVersion {
    return [self majorSystemVersionIsNewerThan:systemVersion];
}

-(BOOL)majorSystemVersionIsNewerThan:(NSString *)systemVersion {
    if ([[self systemVersion] floatValue] >= [systemVersion floatValue]) {
        return YES;
    }
    return NO;
}

-(BOOL)minorSystemVersionIsNewerThan:(NSString *)systemVersion {
    if (![self majorSystemVersionIsNewerThan:systemVersion]) {
        return NO;
    }
    
    NSString *deviceSystemVersion = [self systemVersion];
    deviceSystemVersion = [deviceSystemVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    systemVersion = [systemVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    //Make both system version the same length, otherwise integer value will not say it's higher
    while (systemVersion.length < [deviceSystemVersion length]) {
        systemVersion = [NSString stringWithFormat:@"%@0",systemVersion];
    }
    while (deviceSystemVersion.length < [systemVersion length]) {
        deviceSystemVersion = [NSString stringWithFormat:@"%@0",deviceSystemVersion];
    }
    if ([deviceSystemVersion integerValue] >= [systemVersion integerValue]) {
        return YES;
    }
    return NO;
}

-(BOOL)hasiOS4OrNewer {
    return [self systemVersionIsNewerThan:@"4.0"];
}

-(BOOL)hasiOS5OrNewer {
    return [self systemVersionIsNewerThan:@"5.0"];
}

-(BOOL)hasiOS6OrNewer {
    return [self systemVersionIsNewerThan:@"6.0"];
}

-(BOOL)hasiOS7OrNewer {
    return [self systemVersionIsNewerThan:@"7.0"];
}

-(BOOL)hasiOS8OrNewer {
    return [self systemVersionIsNewerThan:@"8.0"];
}

-(BOOL)hasiOS9OrNewer {
    return [self systemVersionIsNewerThan:@"9.0"];
}

-(BOOL)hasiOS10OrNewer {
    return [self systemVersionIsNewerThan:@"10.0"];
}

@end
