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

static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@interface ISFlakeViewController ()
@property (weak, nonatomic) IBOutlet ISFlakeView *flakeView;
@end

@implementation ISFlakeViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
