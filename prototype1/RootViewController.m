//
//  RootViewController.m
//  prototype1
//
//  Created by Peng Xie on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController
@synthesize chooseBTN;
@synthesize viewallBTN;
@synthesize searchBTN;
@synthesize aboutBTN;

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
	[self.navigationController setNavigationBarHidden:YES animated:YES];
    
    //modifies items for 4in retina displays
    if([UIScreen mainScreen].scale == 2.f && [UIScreen mainScreen].bounds.size.height == 568.0f){
        chooseBTN.frame = CGRectMake(chooseBTN.frame.origin.x,chooseBTN.frame.origin.y+20,chooseBTN.frame.size.width,chooseBTN.frame.size.height*1.2);
        searchBTN.frame = CGRectMake(searchBTN.frame.origin.x,searchBTN.frame.origin.y+45,searchBTN.frame.size.width,searchBTN.frame.size.height*1.2);
        viewallBTN.frame = CGRectMake(viewallBTN.frame.origin.x,viewallBTN.frame.origin.y+20,viewallBTN.frame.size.width,viewallBTN.frame.size.height*1.2);
        aboutBTN.frame = CGRectMake(aboutBTN.frame.origin.x,aboutBTN.frame.origin.y+45,aboutBTN.frame.size.width,aboutBTN.frame.size.height*1.2);
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
