//
//  MainViewController.m
//  prototype1
//
//  Created by Peng Xie on 2/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation MainViewController
@synthesize beginningBTN;
@synthesize foundationBTN;
@synthesize expansionBTN;
@synthesize legacyBTN;
@synthesize discoveryBTN;
@synthesize backBTN;
@synthesize homeBTN;
@synthesize BarTitle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIButton *homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    homeButton.frame = CGRectMake(0, 0, 60, 30);
    [homeButton setImage:[UIImage imageNamed:@"back.png"]
                forState:UIControlStateNormal];
    [homeButton setImage:[UIImage imageNamed:@"back_tap.png"] forState:UIControlStateHighlighted];
    [homeButton addTarget:self action:@selector(backMain:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *doneCover = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
    self.navigationItem.leftBarButtonItem = doneCover;
    [self.navigationItem.leftBarButtonItem setImage:[UIImage imageNamed:@"back.png"]];
    
    UIImage *logo = [UIImage imageNamed: @"museumlogo.png"]; 
    UIImageView *imageView = [[UIImageView alloc] initWithImage: logo]; 
    self.navigationItem.titleView = imageView;
    
    //modifies items for 4in retina displays
    if([UIScreen mainScreen].scale == 2.f && [UIScreen mainScreen].bounds.size.height == 568.0f){
        beginningBTN.frame = CGRectMake(beginningBTN.frame.origin.x,beginningBTN.frame.origin.y+10,beginningBTN.frame.size.width,beginningBTN.frame.size.height*1.25);
        foundationBTN.frame = CGRectMake(foundationBTN.frame.origin.x,foundationBTN.frame.origin.y+20,foundationBTN.frame.size.width,foundationBTN.frame.size.height*1.25);
        expansionBTN.frame = CGRectMake(expansionBTN.frame.origin.x,expansionBTN.frame.origin.y+30,expansionBTN.frame.size.width,expansionBTN.frame.size.height*1.25);
        legacyBTN.frame = CGRectMake(legacyBTN.frame.origin.x,legacyBTN.frame.origin.y+40,legacyBTN.frame.size.width,legacyBTN.frame.size.height*1.25);
        discoveryBTN.frame = CGRectMake(discoveryBTN.frame.origin.x,discoveryBTN.frame.origin.y+50,discoveryBTN.frame.size.width,discoveryBTN.frame.size.height*1.25);
    }
    
  //  [self setTitle];
    
}

- (void)backMain:(id)sender{
    NSLog(@"buttonpushed");
    UIViewController *Detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Main"];
    [self.navigationController pushViewController:Detail animated:YES];
}

- (void)setTitle
{
   /* UILabel *titleView = (UILabel *)self.navigationItem.titleView;
    if (!titleView) {
        titleView = [[UILabel alloc] initWithFrame:CGRectZero];
        titleView.backgroundColor = [UIColor clearColor];
        titleView.font = [UIFont fontWithName:@"Arial" size: 15.0];
        titleView.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.4];
        
        titleView.textColor = [UIColor blackColor]; // Change to desired color
        titleView.text = self.navigationItem.title;
        
        self.navigationItem.titleView = titleView;
    }*/

    //[titleView sizeToFit];
}

- (void)viewDidUnload
{
    [self setBeginningBTN:nil];
    [self setFoundationBTN:nil];
    [self setExpansionBTN:nil];
    [self setLegacyBTN:nil];
    [self setDiscoveryBTN:nil];
    [self setBackBTN:nil];
    [self setHomeBTN:nil];
    [self setBarTitle:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
