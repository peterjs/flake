//
//  ISSceneObject.h
//  Flake
//
//  Created by Peter Somlo on 9/12/13.
//  Copyright (c) 2013 Peter Somlo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ISSceneObject : NSObject <NSCopying>

@property (nonatomic) CGRect AABB;
@property (nonatomic) CGPoint position;
@property (nonatomic) CGSize size;

@property (nonatomic, strong) void(^draw)(CGContextRef);

- (void)renderInContext:(CGContextRef)context;
- (BOOL)hit:(CGPoint)hitPosition;

@end
