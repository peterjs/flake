//
//  ISSceneObject.m
//  Flake
//
//  Created by Peter Somlo on 9/12/13.
//  Copyright (c) 2013 Peter Somlo. All rights reserved.
//

#import "ISSceneObject.h"
#import "DDLog.h"

static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@implementation ISSceneObject

@synthesize AABB = _AABB;
@synthesize position = _position;
@synthesize size = _size;
@synthesize draw = _draw;

- (CGRect)AABB {
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0.0, 0.0);
    //    transform = CGAffineTransformTranslate(transform, self.position.x, self.position.y);
    //    transform = CGAffineTransformRotate(transform, self.roofAngle);
    //    transform = CGAffineTransformScale(transform, self.roofScale, self.roofScale);
    
    //        self.roofAABB = CGRectApplyAffineTransform(roofOriginal, transform);
    
    //    transform = CGAffineTransformRotate(transform, self.angle);
    
    CGRect originalRect = CGRectMake(self.position.x, self.position.y, self.size.width, self.size.height);
    
    return originalRect;
    return CGRectApplyAffineTransform(originalRect, transform);
}

//render to offscreen buffer, to test intersection
- (BOOL)hit:(CGPoint)hitPosition {
    //render to a dummy canvas and find if the hit point is filled or not
    //    CGContextRef testContext = CGContext
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    //In iOS 4.0 and later, and OS X v10.6 and later, you can pass NULL if you want Quartz to allocate memory for the bitmap.
    CGContextRef testContext = CGBitmapContextCreate(NULL, self.size.width, self.size.height, 8, 4*self.size.width, colorspace, kCGBitmapAlphaInfoMask & kCGImageAlphaPremultipliedFirst);
    
    UInt8* data = CGBitmapContextGetData(testContext);
    
    UIGraphicsPushContext(testContext);
    self.draw(testContext);
    
    //self.size.height-
    
    CGPoint coord = CGPointMake(hitPosition.x-self.position.x, self.size.height-(hitPosition.y-self.position.y));
    DDLogVerbose(@"coord %f %f", coord.x, coord.y);
    int alpha = 0;
    if (data != NULL) {
        int offset = 4*((self.size.width*round(coord.y))+round(coord.x));
        alpha =  data[offset];
        int red = data[offset+1];
        int green = data[offset+2];
        int blue = data[offset+3];
        
        DDLogVerbose(@"alpha: %i red: %i green: %i blue: %i", alpha, red, green, blue);
        
    }
    
    UIGraphicsPopContext();
    BOOL hit = YES;
    if (alpha == 0) hit = NO;
    return hit;
}

- (void)renderInContext:(CGContextRef)context {
    CGContextSaveGState(context);
    
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0.0, 0.0);
    transform = CGAffineTransformTranslate(transform, self.position.x, self.position.y);
    //    transform = CGAffineTransformRotate(transform, self.roofAngle);
    //    transform = CGAffineTransformScale(transform, self.roofScale, self.roofScale);
    
    //        self.roofAABB = CGRectApplyAffineTransform(roofOriginal, transform);
    
    //    transform = CGAffineTransformRotate(transform, self.angle);
    
    CGContextConcatCTM(context, transform);
    self.draw(context);
    
    CGContextRestoreGState(context);
}

//Keys in a dictionary are copied. The objects are retained. Usually, strings are used as keys, and since they do conform to NSCopying, there's no issues. If for some reason you wanted to use some other kind of object, you'd have to make certain it conformed to NSCopying as well.

- (id)copyWithZone:(NSZone *)zone
{
    ISSceneObject *obj = [[ISSceneObject alloc] init];
    obj.AABB = self.AABB;
    obj.position = self.position;
    obj.size = self.size;
    obj.draw = self.draw;
    return obj;
}

@end