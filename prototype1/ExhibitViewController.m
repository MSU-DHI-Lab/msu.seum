//
//  ExhibitViewController.m
//  prototype1
//
//  Created by Peng Xie on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExhibitViewController.h"

@interface ExhibitViewController ()

@end

@implementation ExhibitViewController
@synthesize textView;
@synthesize scrollView;
@synthesize labelView;
@synthesize exhBTN;

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
    UIButton *homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    homeButton.frame = CGRectMake(0, 0, 60, 30);
    [homeButton setImage:[UIImage imageNamed:@"back.png"]
                forState:UIControlStateNormal];
    [homeButton addTarget:self action:@selector(backMain:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *doneCover = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
    self.navigationItem.leftBarButtonItem = doneCover;
    [self.navigationItem.leftBarButtonItem setImage:[UIImage imageNamed:@"back.png"]];
    [homeButton setImage:[UIImage imageNamed:@"back_tap.png"] forState:UIControlStateHighlighted];
    //custom title
    //UILabel *titleView = (UILabel *)self.navigationItem.titleView;
   /* UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectNull];
    titleView.backgroundColor = [UIColor clearColor];
    titleView.font = [UIFont fontWithName:@"Arial" size: 15.0];
    titleView.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.40];
    
    titleView.textColor = [UIColor blackColor]; // Change to desired color
    titleView.text = self.navigationItem.title;
    
    self.navigationItem.titleView = titleView;
    [titleView sizeToFit];*/
    
    UIImage *logo = [UIImage imageNamed: @"museumlogo.png"]; 
    UIImageView *imageView = [[UIImageView alloc] initWithImage: logo]; 
    self.navigationItem.titleView = imageView;
    [self.scrollView setContentSize:CGSizeMake(textView.frame.size.width, textView.frame.size.height + self.labelView.frame.size.height+ 30)];
    
    //modifies items for 4in retina displays
    int scrollViewMod = 0;
    if([UIScreen mainScreen].scale == 2.f && [UIScreen mainScreen].bounds.size.height == 568.0f){
        scrollViewMod = 80;
        exhBTN.frame = CGRectMake(exhBTN.frame.origin.x,exhBTN.frame.origin.y+80,exhBTN.frame.size.width,exhBTN.frame.size.height);
    }

    self.scrollView.frame = CGRectMake(0, 220,320, 190+scrollViewMod);
    self.scrollView.scrollEnabled = true;
    [super viewDidLoad];


}

- (void)backMain:(id)sender{
    NSLog(@"buttonpushed");
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    UIViewController *Detail = [self.storyboard instantiateViewControllerWithIdentifier:@"MainView"];
    [self.navigationController pushViewController:Detail animated:YES];
    Detail.navigationItem.hidesBackButton = YES;
}

- (void)viewDidUnload
{
    [self setTextView:nil];
    [self setScrollView:nil];
    [self setLabelView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
