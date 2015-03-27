//
//  AWKImageHelper.m
//  AWKHelpers
//
//  Created by Rens Verhoeven on 27-03-15.
//  Copyright (c) 2015 Awkward. All rights reserved.
//

#import "AWKImageHelper.h"

@implementation UIImage (AWKImageHelper)

- (UIImage *)imageToFitSize:(CGSize)size method:(AWKImageResizingMethod)method {
    CGFloat imageScaleFactor = 1.0;
    if ([self respondsToSelector:@selector(scale)]) {
        imageScaleFactor = [self scale];
    }
    
    CGFloat sourceWidth = [self size].width;
    CGFloat sourceHeight = [self size].height;
    CGFloat targetWidth = size.width;
    CGFloat targetHeight = size.height;
    
    CGFloat sourceRatio = sourceWidth / sourceHeight;
    
    CGSize newSize = CGSizeMake(sourceWidth, sourceHeight);
    CGRect destinationRect = CGRectZero;
    CGRect sourceRect = CGRectZero;
    
    if (method == AWKImageResizingScale || method == AWKImageResizingScaleNoZoom ) {
        if (newSize.width < size.width && newSize.height < size.height && method == AWKImageResizingScaleNoZoom) {
            destinationRect.size = newSize;
            sourceRect = CGRectZero;
            sourceRect.size = CGSizeMake(sourceWidth, sourceHeight);
        } else {
            CGFloat scaleFactor = 0.0f;
            if (sourceRatio >= 1.0) {
                //Landscape
                scaleFactor = sourceWidth / targetWidth;
            } else {
                //Portrait
                scaleFactor = sourceHeight / targetHeight;
            }
            CGFloat newWidth = floorf(sourceWidth/scaleFactor);
            CGFloat newHeight = floorf(sourceHeight/scaleFactor);
            
            newSize = CGSizeMake(newWidth, newHeight);
            destinationRect.size = newSize;
            sourceRect = CGRectZero;
            sourceRect.size = CGSizeMake(sourceWidth, sourceHeight);
        }
    }
    
    UIImage *image = nil;
    
    CGImageRef sourceImage = nil;
    if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(destinationRect.size, NO, 0.0f);
        sourceImage = CGImageCreateWithImageInRect([self CGImage], sourceRect);
        image = [UIImage imageWithCGImage:sourceImage scale:0.0f orientation:self.imageOrientation];
    } else {
        UIGraphicsBeginImageContext(destinationRect.size);
        sourceImage = CGImageCreateWithImageInRect([self CGImage], sourceRect);
        image = [UIImage imageWithCGImage:sourceImage];
    }
    
    CGImageRelease(sourceImage);
    [image drawInRect:destinationRect];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)imageScaledToFitSize:(CGSize)size {
    return [self imageScaledToFitSize:size allowZoom:NO];
}

- (UIImage *)imageScaledToFitSize:(CGSize)size allowZoom:(BOOL)allowZoom {
    if (allowZoom) {
        return [self imageToFitSize:size method:AWKImageResizingScale];
    } else {
        return [self imageToFitSize:size method:AWKImageResizingScaleNoZoom];
    }
    
}

@end
