//
//  ISFlakeView.m
//  Flake
//
//  Created by Peter Somlo on 9/12/13.
//  Copyright (c) 2013 Peter Somlo. All rights reserved.
//

#import "ISFlakeView.h"
#import "DDLog.h"
#import "ISSceneObject.h"

static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@implementation ISFlakeView

@synthesize sceneObjects;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{

}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (ISSceneObject* sceneObj in self.sceneObjects) {
        [sceneObj renderInContext:context];
    }
}

@end
