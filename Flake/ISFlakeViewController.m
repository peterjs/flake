//
//  ISFlakeViewController.m
//  Flake
//
//  Created by Peter Somlo on 9/12/13.
//  Copyright (c) 2013 Peter Somlo. All rights reserved.
//

#import "ISFlakeViewController.h"
#import "ISFlakeView.h"
#import "DDLog.h"
#import "ISSceneObject.h"

static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@interface ISFlakeViewController ()
@property (weak, nonatomic) IBOutlet ISFlakeView *flakeView;
@end

@implementation ISFlakeViewController {
    ISSceneObject* _roof;
    ISSceneObject* _fire;
    ISSceneObject* _animal;
    
    //or an ordered set....
    NSMutableOrderedSet* _scene;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"whwhwhwhwwh");
    DDLogVerbose(@"whwhwhwhwwh");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"qqqqqqqqqqq");
    DDLogVerbose(@"qqqqqqqqqqq");
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(update) userInfo:nil repeats:YES];
    [self setupScene];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupScene
{
    
    DDLogError(@"Broken sprocket detected!");
    DDLogVerbose(@"User selected file:%i withSize:%i", 1, 2);
    
    //    _positions = [[NSMutableDictionary alloc] init];
    //    _dimensions = [[NSMutableDictionary alloc] init];
    _scene = [[NSMutableOrderedSet alloc] init];
    
    _roof = [[ISSceneObject alloc] init];
    //make in percentage
    _roof.position = CGPointMake(350.0, 350.0);
    float roofHeight = 200.0;
    float roofWidth = 200.0;
    _roof.size = CGSizeMake(200.0, 200.0);
    _roof.draw = ^(CGContextRef context) {
        //        CGRect roofOriginal = CGRectMake(0-edge/1.5, 0-edge/2, 2*edge/1.5, edge);
        [[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.7] setFill];
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, roofWidth/2.0, 0.0);
        CGContextAddLineToPoint(context, roofWidth, roofHeight);
        CGContextAddLineToPoint(context, 0.0, roofHeight);
        CGContextAddLineToPoint(context, roofWidth/2.0, 0.0);
        CGContextClosePath(context);
        CGContextFillPath(context);
    };
    
    
    _fire = [[ISSceneObject alloc] init];
    _fire.position = CGPointMake(150.0, 150.0);
    _fire.size = CGSizeMake(400, 582);
    _fire.draw = ^(CGContextRef context) {
        [[UIImage imageNamed:@"red_yellow_fire_logo.png"] drawAtPoint:CGPointMake(0.0,0.0)];
        
        [[UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.6] setFill];
        
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, _fire.size.width, 0);
        CGContextAddLineToPoint(context, _fire.size.width, _fire.size.height);
        CGContextAddLineToPoint(context, 0, _fire.size.height);
        CGContextClosePath(context);
        
        CGContextFillPath(context);
    };
    
    _animal = [[ISSceneObject alloc] init];
    _animal.position = CGPointMake(150.0, 150.0);
    _animal.size = CGSizeMake(400, 400);
//    UIImage* resizedAnimal = [FaceView imageWithImage:[UIImage imageNamed:@"activeden_fox.png"] scaledToSize:_animal.size];
    _animal.draw = ^(CGContextRef context) {
//        [resizedAnimal drawAtPoint:CGPointMake(0.0,0.0)];
        
//        [[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:self.kSnow] setFill];
        
        [[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0] setFill];
        
        
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, _animal.size.width, 0);
        CGContextAddLineToPoint(context, _animal.size.width, _animal.size.height);
        CGContextAddLineToPoint(context, 0, _animal.size.height);
        CGContextClosePath(context);
        
        CGContextFillPath(context);
        
        //        [[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0] setFill];
        //        float edge = 400;
        //        CGContextBeginPath(context);
        //        CGContextMoveToPoint(context, 0, 0);
        //        CGContextAddLineToPoint(context, 0, edge/2);
        //        CGContextAddLineToPoint(context, edge/2, edge/2);
        //        CGContextAddLineToPoint(context, edge/2, 0);
        //        CGContextAddLineToPoint(context, 0, 0);
        //        CGContextClosePath(context);
        //
        //
        //        CGContextFillPath(context);
        //
        //        [[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0] setFill];
        //        CGContextBeginPath(context);
        //        CGContextMoveToPoint(context, edge/2, 0);
        //        CGContextAddLineToPoint(context, edge/2, edge);
        //        CGContextAddLineToPoint(context, edge, edge);
        //        CGContextAddLineToPoint(context, edge, 0);
        //        CGContextAddLineToPoint(context, edge/2, 0);
        //        CGContextClosePath(context);
        //
        //        CGContextFillPath(context);
    };
    
    [_scene addObject:_animal];
    [_scene addObject:_fire];
    [_scene addObject:_roof];
    
    self.flakeView.sceneObjects = _scene;
    
//    self.contentMode = UIViewContentModeRedraw; // if our bounds changes, redraw ourselves
}


- (void)update
{
    DDLogVerbose(@"tick");
}

@end
