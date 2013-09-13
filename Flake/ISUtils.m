//
//  ISUtils.m
//  Flake
//
//  Created by Peter Somlo on 9/13/13.
//  Copyright (c) 2013 Peter Somlo. All rights reserved.
//

#import "ISUtils.h"

@implementation ISUtils

+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)newSize
{
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
