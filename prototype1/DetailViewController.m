//
//  DetailViewController.m
//  prototype1
//
//  Created by Xie Peng on 12/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController
@synthesize scrollView;
@synthesize textview;
@synthesize imageview;

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

- (void)viewDidLoad
{
    UIImage *selectedImage0 = [UIImage imageNamed:@"info_active.png"];
    UIImage *unselectedImage0 = [UIImage imageNamed:@"info.png"];
    
    UIImage *selectedImage1 = [UIImage imageNamed:@"dig_active.png"];
    UIImage *unselectedImage1 = [UIImage imageNamed:@"dig.png"];
    
    UIImage *selectedImage2 = [UIImage imageNamed:@"media_active.png"];
    UIImage *unselectedImage2 = [UIImage imageNamed:@"media.png"];
    
    UITabBar *tabBar = self.tabBarController.tabBar;
    UITabBarItem *item0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabBar.items objectAtIndex:2];
        
    [item0 setFinishedSelectedImage:selectedImage0 withFinishedUnselectedImage:unselectedImage0];
    [item1 setFinishedSelectedImage:selectedImage1 withFinishedUnselectedImage:unselectedImage1];
    [item2 setFinishedSelectedImage:selectedImage2 withFinishedUnselectedImage:unselectedImage2];
    
    [item0 setTitle:@""];
    [item1 setTitle:@""];
    [item2 setTitle:@""];
    
   

    
  //  [scrollView setContentSize:CGSizeMake(320, 720)];
    
    [self.scrollView setContentSize:CGSizeMake(textview.frame.size.width, textview.frame.size.height)];
    
    //modifies items for 4in retina displays
    int scrollViewMod = 0;
    if([UIScreen mainScreen].scale == 2.f && [UIScreen mainScreen].bounds.size.height == 568.0f){
        scrollViewMod = 90;
    }
    
    switch (imageview.tag) {
        //default imageviews, puts image at the top of the view
        case 0:
            self.scrollView.frame = CGRectMake(0, 210,320, 245+scrollViewMod);
            [self.scrollView setContentOffset:CGPointMake(0, 15)];
            break;
        //case for Williams hall "dig deeper"
        case 1:
            self.scrollView.frame = CGRectMake(0, 210,320, 245+scrollViewMod);
            [self.scrollView setContentOffset:CGPointMake(0, 15)];
            break;
        //case for W.J Beal gardens "dig deeper
        case 2:
            self.scrollView.frame = CGRectMake(0, 210,320, 245+scrollViewMod);
            [self.scrollView setContentOffset:CGPointMake(0, 15)];
            break;
            //case for Morrill Hall "dig deeper
        case 3:
            self.scrollView.frame = CGRectMake(0, 210,320, 245+scrollViewMod);
            [self.scrollView setContentOffset:CGPointMake(0, 15)];
            break;
        default:
            break;
    }
    self.scrollView.scrollEnabled = true;
    [super viewDidLoad];

    
}

-(void)viewWillAppear:(BOOL)animated
{
    CGRect navframe = [[self.navigationController navigationBar] frame];
    
    NSLog(@"height => : %g", navframe.size.height);
    self.imageview.frame = CGRectMake(0, 0, 320, self.imageview.frame.size.height);
    //NSLog(@"imageview height => %g", imageview.frame.origin.y);

}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [self setTextview:nil];
    [self setImageview:nil];
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
