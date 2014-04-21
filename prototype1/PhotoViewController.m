//
//  PhotoViewController.m
//  PhotoViewer
//
//  Created by Peng Xie on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoSet.h"

@implementation PhotoViewController
@synthesize photoSet = _photoSet;
@synthesize selfTitle = _selfTitle;

static NSString *myTitle = nil;
static NSString *theTitle = nil;
+ (NSString *)getTitle{
    myTitle = nil;
    if (myTitle == nil) {
        myTitle = theTitle;
    }
    NSLog(@"got title");
    return myTitle;
}

- (void) viewDidLoad {
    theTitle = self.title;
    self.photoSource = [PhotoSet samplePhotoSet];
    self.wantsFullScreenLayout = NO;
    self.hidesBottomBarWhenPushed = NO; 
}


//To make the navigationbar the same style as the Three20 gallery.
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    //UINavigationController* navController = self.navigationController;
    
    //navController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
    [self setWantsFullScreenLayout:NO];
    
    [[TTURLRequestQueue mainQueue] setMaxContentLength:0];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage 
                                                                imageNamed:@"paper_background.png"]];
}

-(void) viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}



@end