//
//  timeViewController.m
//  Timer
//
//  Created by Peng Xie on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "timeViewController.h"

@implementation timeViewController
@synthesize splashBtn;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    UIImage *logo = [UIImage imageNamed:@"splashscreen.png"];
    
    self.splashBtn.frame = CGRectMake(0, 0, logo.size.width, logo.size.height);
    
    [super viewDidLoad];
    float timer=4.0;
        
    [NSTimer scheduledTimerWithTimeInterval:timer target:self selector:@selector(startAfterInterval:) userInfo:nil repeats:NO];
}

- (void)startAfterInterval:(NSTimer *)timer {
    [self performSegueWithIdentifier:@"root" sender:self];
}

- (void)viewDidUnload
{
    [self setSplashBtn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
