//
//  AWKImageHelper.h
//  AWKHelpers
//
//  Created by Rens Verhoeven on 27-03-15.
//  Copyright (c) 2015 Awkward. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (AWKImageHelper)

typedef enum {
    AWKImageResizingScale,
    AWKImageResizingScaleNoZoom,
} AWKImageResizingMethod;

/**
 Returns a image sized to the given size based on the given sizing method
 
 @param size The maximum of minimum size of the image
 @param method The method used to fit the image
 
 @return Returns the newly created image
 */
- (UIImage *)imageToFitSize:(CGSize)size method:(AWKImageResizingMethod)method;

/**
 Returns a image with a maximum size without zooming
 
 @param size The maximum size of the image
 
 @return Returns the newly created image
 */
- (UIImage *)imageScaledToFitSize:(CGSize)size;

/**
 Returns a image with a maximum size
 
 @param size The maximum size of the image
 @param allowZoom If zooming the image is allowed, if the image is smaller than the size the image is not zoomed if allowZoom is NO
 
 @return Returns the newly created image
 */
- (UIImage *)imageScaledToFitSize:(CGSize)size allowZoom:(BOOL)allowZoom;

@end
