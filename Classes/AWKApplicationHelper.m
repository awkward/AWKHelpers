//
//  AWKApplicationHelper.m
//  AWKHelpers
//
//  Created by Rens Verhoeven on 04-11-14.
//  Copyright (c) 2014 Awkward. All rights reserved.
//

#import "AWKApplicationHelper.h"

@implementation UIApplication (AWKApplicationHelper)

- (NSString *)documentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

- (NSString *)appVersion {
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    return [info objectForKey:@"CFBundleShortVersionString"];
}

- (NSString *)buildVersion {
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    return [info objectForKey:@"CFBundleVersion"];
}

@end
