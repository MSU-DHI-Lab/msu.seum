//
//  MainAboutViewController.m
//  prototype1
//
//  Created by Peng Xie on 4/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainAboutViewController.h"

@interface MainAboutViewController ()

@end

@implementation MainAboutViewController
@synthesize scrollview;
@synthesize textview;
@synthesize logo;
@synthesize aboutMatrix;
@synthesize aboutChi;
@synthesize aboutCampus;
@synthesize aboutArchives;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"About";
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.hidesBackButton = YES;
	UIButton *homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    homeButton.frame = CGRectMake(0, 0, 60, 30);
    [homeButton setImage:[UIImage imageNamed:@"back.png"]
                forState:UIControlStateNormal];
    [homeButton setImage:[UIImage imageNamed:@"back_tap.png"] forState:UIControlStateHighlighted];
     
    [homeButton addTarget:self action:@selector(backMain:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *doneCover = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
    self.navigationItem.leftBarButtonItem = doneCover;
    [self.navigationItem.leftBarButtonItem setImage:[UIImage imageNamed:@"back.png"]];
    //UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectNull];
   // titleView.backgroundColor = [UIColor clearColor];
   // titleView.font = [UIFont fontWithName:@"Arial" size: 15.0];
   // titleView.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.4];
    
    UIImage *logod = [UIImage imageNamed: @"museumlogo.png"]; 
    UIImageView *imageView = [[UIImageView alloc] initWithImage: logod]; 
    self.navigationItem.titleView = imageView;
    
  //  titleView.textColor = [UIColor blackColor]; // Change to desired color
   // titleView.text = self.navigationItem.title;
    
   // self.navigationItem.titleView = titleView;
   // [titleView sizeToFit];
    self.textview.editable = false;
    
    //modifies items for 4in retina displays
    if([UIScreen mainScreen].scale == 2.f && [UIScreen mainScreen].bounds.size.height == 568.0f){
        self.scrollview.frame = CGRectMake(self.scrollview.frame.origin.x,self.scrollview.frame.origin.y-90,self.scrollview.frame.size.width,self.scrollview.frame.size.height+80);
    }

   
    self.aboutMatrix.frame = CGRectMake(0, 130 + self.logo.frame.size.height+ self.textview.frame.size.height ,  self.aboutMatrix.frame.size.width, self.aboutMatrix.frame.size.height);
    
    self.aboutChi.frame = CGRectMake(0, 135 + self.logo.frame.size.height + self.textview.frame.size.height+self.aboutMatrix.frame.size.height, self.aboutChi.frame.size.width, self.aboutChi.frame.size.height);
    
    self.aboutCampus.frame = CGRectMake(0, 140 + self.logo.frame.size.height + self.textview.frame.size.height+self.aboutMatrix.frame.size.height + self.aboutChi.frame.size.height, self.aboutCampus.frame.size.width, self.aboutCampus.frame.size.height);
    
    self.aboutArchives.frame = CGRectMake(0, 145+ self.logo.frame.size.height + self.textview.frame.size.height+self.aboutMatrix.frame.size.height + self.aboutChi.frame.size.height + self.aboutCampus.frame.size.height, self.aboutCampus.frame.size.width, self.aboutArchives.frame.size.height);
    
    self.aboutMatrix.center = CGPointMake(self.scrollview.frame.size.width/2, self.aboutMatrix.frame.origin.y);
    self.aboutChi.center = CGPointMake(self.scrollview.frame.size.width/2, self.aboutChi.frame.origin.y);
    self.aboutCampus.center = CGPointMake(self.scrollview.frame.size.width/2, self.aboutCampus.frame.origin.y);
    self.aboutArchives.center = CGPointMake(self.scrollview.frame.size.width/2, self.aboutArchives.frame.origin.y);

    [self.scrollview setContentSize:CGSizeMake(self.textview.frame.size.width, self.textview.frame.size.height + self.logo.frame.size.height + self.aboutMatrix.frame.size.height + self.aboutChi.frame.size.height + self.aboutCampus.frame.size.height + self.aboutArchives.frame.size.height + 160)];
    
    self.aboutMatrix.accessibilityValue = @"http://matrix.msu.edu";
    self.aboutChi.accessibilityValue = @"http://chi.anthropology.msu.edu";
    self.aboutCampus.accessibilityValue = @"http://campusarch.msu.edu/";
    self.aboutArchives.accessibilityValue = @"http://archives.msu.edu/";
}

-(IBAction)buttomPressed:(id)sender
{
    NSURL *url = [ [ NSURL alloc ] initWithString:[sender accessibilityValue]];
    [[UIApplication sharedApplication] openURL:url];
    
}

- (void)backMain:(id)sender{
    NSLog(@"buttonpushed");
    UIViewController *Detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Main"];
    [self.navigationController pushViewController:Detail animated:YES];
}

- (void)viewDidUnload
{
    [self setScrollview:nil];
    [self setTextview:nil];
    [self setLogo:nil];
    [self setAboutMatrix:nil];
    [self setAboutChi:nil];
    [self setAboutCampus:nil];
    [self setAboutArchives:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
