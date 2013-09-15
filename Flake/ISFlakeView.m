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

//global variables private to your implementation should usually be declared static to avoid polluting the global namespace and risking link-time errors
static const int ddLogLevel = LOG_LEVEL_VERBOSE;

//http://stackoverflow.com/questions/13566862/where-to-put-ivars-in-modern-objective-c
@implementation ISFlakeView {
//Instance variables declared in the implementation are implicitly hidden (effectively private) and the visibility cannot be changed - @public, @protected and @private do not produce compiler errors (with the current Clang at least) but are ignored.
//@public, etc. can be used in the @interface
    NSMutableDictionary* _gestureRecognizers;
}

@synthesize sceneObjects;

//private
- (void)setup
{
    _gestureRecognizers = [[NSMutableDictionary alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    DDLogVerbose(@"initWithFrame");
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}


//called at resource loading, awakeFromNib is called afterwards
- (id)initWithCoder:(NSCoder *)aDecoder
{
    DDLogVerbose(@"initWithCoder");
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

//http://stackoverflow.com/questions/6436895/init-and-awakefromnib
//awakeFromNib is called after initWithCoder (or initWithFrame, init) and outlet (links to buttons, etc.) setup
//called after viewDidLoad of the UIViewController is called
- (void)awakeFromNib
{
    DDLogVerbose(@"awakeFromNib");
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

//TODO add gesture recognizers to an object into an array - multiple different recognizers
- (void)addGestureRecognizer:(Class)gestureRecognizer withTarget:(id)target action:(SEL)action forObject:(id)object;
{
    if ([gestureRecognizer isSubclassOfClass:[UIGestureRecognizer class]]) {
        DDLogVerbose(@"add gestureRecognizer class %@", gestureRecognizer);
    
        [self addGestureRecognizer:[[gestureRecognizer alloc] initWithTarget:target action:action]];
    [_gestureRecognizers setObject:@{@"target":target, @"selector":[NSValue valueWithBytes:action objCType:@encode(SEL)]} forKey:object];
    }
    DDLogVerbose(@"all recognizers %@", _gestureRecognizers);
}

#pragma mark UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    DDLogVerbose(@"gestureRecognizer %@", gestureRecognizer);
    return YES;
}

@end
